"""Integration tests for the R summarizer layer.

Tests that PEPATACr's yamlToDT and summarizer functions correctly handle
pipestat YAML output containing mixed scalar and object-type fields.

These tests reproduce the data.table recycling warning bug (issue #323)
and verify the fix works end-to-end through the actual R code path.

Prerequisites:
- R >= 4.0 with PEPATACr, data.table, yaml packages installed
- RUN_INTEGRATION_TESTS=true

Test-driven approach:
  These tests are written BEFORE the fix. They FAIL on current code
  (recycling warnings in R output), then PASS after the fix is applied.
"""

import os
import subprocess
import pytest

pytestmark = [
    pytest.mark.skipif(
        os.getenv("RUN_INTEGRATION_TESTS") != "true",
        reason="Integration tests disabled.",
    ),
]

TESTS_DIR = os.path.dirname(os.path.dirname(__file__))
PROJECT_ROOT = os.path.dirname(TESTS_DIR)
FIXTURES_DIR = os.path.join(TESTS_DIR, "fixtures")
PEPATACR_DIR = os.path.join(PROJECT_ROOT, "PEPATACr")

# Preamble that loads PEPATACr from source (handles both installed and dev).
# pkgload::load_all() loads from source like devtools, so tests always run
# against the current code, not the installed package version.
_R_PREAMBLE = f'''
if (requireNamespace("pkgload", quietly=TRUE)) {{
    pkgload::load_all("{PEPATACR_DIR}", quiet=TRUE)
}} else {{
    library(PEPATACr)
}}
library(yaml)
'''


def _run_r_code(r_code, timeout=60):
    """Run an R code snippet and return (stdout, stderr, returncode)."""
    result = subprocess.run(
        ["Rscript", "-e", r_code],
        capture_output=True, text=True, timeout=timeout,
    )
    return result.stdout, result.stderr, result.returncode


def _r_available():
    """Check if R and PEPATACr are available."""
    try:
        _, _, rc = _run_r_code(
            _R_PREAMBLE + 'cat("ok")', timeout=30)
        return rc == 0
    except (FileNotFoundError, subprocess.TimeoutExpired):
        return False


@pytest.fixture(scope="module", autouse=True)
def require_r():
    if not _r_available():
        pytest.skip("R or PEPATACr not available")


class TestYamlToDTRecyclingBug:
    """Reproduce and verify fix for the data.table recycling warning."""

    def test_no_recycling_warning_with_object_fields(self):
        """THE BUG TEST: yamlToDT must not produce recycling warnings."""
        fixture = os.path.join(FIXTURES_DIR, "stats_yaml_with_objects.yaml")
        r_code = _R_PREAMBLE + f'''
        yaml_file <- yaml::read_yaml("{fixture}",
            handlers=list(int=function(x) as.numeric(x)))
        w <- NULL
        withCallingHandlers(
            dt <- yamlToDT("test1", yaml_file),
            warning = function(cond) {{
                w <<- c(w, conditionMessage(cond))
                invokeRestart("muffleWarning")
            }}
        )
        if (!is.null(w)) {{
            cat("WARNINGS_FOUND\\n")
            for (msg in w) cat(paste0("WARNING: ", msg, "\\n"))
            quit(status = 1)
        }}
        cat(paste0("ROWS: ", nrow(dt), "\\n"))
        cat("OK\\n")
        '''
        stdout, stderr, rc = _run_r_code(r_code)
        assert "WARNINGS_FOUND" not in stdout, (
            f"Recycling warning detected (this is the bug):\n{stdout}"
        )
        assert rc == 0, f"R script failed:\n{stderr}"
        assert "OK" in stdout

    def test_object_columns_excluded(self):
        """All object-type fields must be excluded from output data.table."""
        fixture = os.path.join(FIXTURES_DIR, "stats_yaml_with_objects.yaml")
        object_fields = [
            "Fragment distribution", "Library complexity",
            "TSS enrichment", "Motif analysis",
            "Peak chromosome distribution",
            "Peak partition distribution", "cFRiF", "FRiF",
            "FastQC report r1", "FastQC report r2",
            "TSS distance distribution", "meta",
        ]
        r_code = _R_PREAMBLE + f'''
        yaml_file <- yaml::read_yaml("{fixture}",
            handlers=list(int=function(x) as.numeric(x)))
        dt <- suppressWarnings(yamlToDT("test1", yaml_file))
        cols <- names(dt)
        cat(paste(cols, collapse="\\n"))
        '''
        stdout, stderr, rc = _run_r_code(r_code)
        assert rc == 0, f"R script failed:\n{stderr}"
        columns = stdout.strip().split("\n")
        for field in object_fields:
            assert field not in columns, (
                f"Object field '{field}' should not be in output columns. "
                f"Got columns: {columns}"
            )

    def test_one_row_per_sample(self):
        """yamlToDT must produce exactly one row per sample."""
        fixture = os.path.join(FIXTURES_DIR, "stats_yaml_with_objects.yaml")
        r_code = _R_PREAMBLE + f'''
        yaml_file <- yaml::read_yaml("{fixture}",
            handlers=list(int=function(x) as.numeric(x)))
        dt <- suppressWarnings(yamlToDT("test1", yaml_file))
        cat(nrow(dt))
        '''
        stdout, stderr, rc = _run_r_code(r_code)
        assert rc == 0, f"R script failed:\n{stderr}"
        assert stdout.strip() == "1", (
            f"Expected 1 row, got {stdout.strip()} "
            "(recycling produced duplicate rows)"
        )

    def test_scalar_values_preserved(self):
        """Scalar fields must be preserved in the output."""
        fixture = os.path.join(FIXTURES_DIR, "stats_yaml_with_objects.yaml")
        r_code = _R_PREAMBLE + f'''
        yaml_file <- yaml::read_yaml("{fixture}",
            handlers=list(int=function(x) as.numeric(x)))
        dt <- suppressWarnings(yamlToDT("test1", yaml_file))
        stopifnot("Raw_reads" %in% names(dt))
        stopifnot("Aligned_reads" %in% names(dt))
        stopifnot("Peak_count" %in% names(dt))
        stopifnot("FRiP" %in% names(dt))
        stopifnot("Picard_est_lib_size" %in% names(dt))
        stopifnot("FRiP_ref" %in% names(dt))
        cat("OK")
        '''
        stdout, stderr, rc = _run_r_code(r_code)
        assert rc == 0, f"Scalar fields missing:\n{stderr}"
        assert "OK" in stdout


class TestRSummarizerEndToEnd:
    """End-to-end test of the R summarizer data assembly path."""

    def test_summarizer_data_assembly_no_warnings(self):
        """Full yamlToDT->rbindlist chain should work without warnings."""
        fixture = os.path.join(FIXTURES_DIR, "stats_yaml_with_objects.yaml")
        r_code = _R_PREAMBLE + f'''
        yaml_file <- yaml::read_yaml("{fixture}",
            handlers=list(int=function(x) as.numeric(x)))
        sample_names <- names(yaml_file$PEPATAC$sample)
        w <- NULL
        withCallingHandlers(
            stats <- data.table::rbindlist(
                lapply(sample_names, FUN=yamlToDT,
                       yaml_file=yaml_file),
                fill=TRUE),
            warning = function(cond) {{
                w <<- c(w, conditionMessage(cond))
                invokeRestart("muffleWarning")
            }}
        )
        if (!is.null(w)) {{
            cat("WARNINGS_FOUND\\n")
            for (msg in w) cat(paste0("WARNING: ", msg, "\\n"))
            quit(status = 1)
        }}
        cat(paste0("ROWS: ", nrow(stats), "\\n"))
        cat(paste0("COLS: ", ncol(stats), "\\n"))
        cat("OK\\n")
        '''
        stdout, stderr, rc = _run_r_code(r_code)
        assert "WARNINGS_FOUND" not in stdout, (
            f"Recycling warning in data assembly:\n{stdout}"
        )
        assert rc == 0, f"R script failed:\n{stderr}"
        assert "OK" in stdout
