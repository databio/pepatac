"""Test that pipeline failures are properly detected by tests."""

import os
import subprocess
import sys
import pytest

pytestmark = pytest.mark.skipif(
    os.getenv("RUN_INTEGRATION_TESTS") != "true",
    reason="Integration tests disabled.",
)

PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
PIPELINE_SCRIPT = os.path.join(PROJECT_ROOT, "pipelines", "pepatac.py")


def test_missing_input_file_creates_failed_flag(test_output_factory):
    """When pipeline fails due to missing input, failed.flag should be created."""
    output_dir = test_output_factory("failure_test")
    sample_dir = os.path.join(str(output_dir), "test_failure")

    # Run pipeline with nonexistent input file
    cmd = [
        sys.executable, PIPELINE_SCRIPT,
        "--sample-name", "test_failure",
        "--genome", "hg38",
        "--input", "/nonexistent/file.fastq.gz",
        "--single-or-paired", "single",
        "--output-parent", str(output_dir),
        "--genome-index", "/tmp/fake",
        "--chrom-sizes", "/tmp/fake.sizes",
    ]

    result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)

    # Pipeline should fail
    assert result.returncode != 0, "Pipeline should return non-zero on failure"

    # Failed flag should exist
    failed_flag = os.path.join(sample_dir, "PEPATAC_test_failure_failed.flag")
    assert os.path.isfile(failed_flag), (
        f"Failed flag not created at {failed_flag}. "
        f"This indicates pypiper failed to write the flag."
    )

    # Completed flag should NOT exist
    completed_flag = os.path.join(sample_dir, "PEPATAC_completed.flag")
    assert not os.path.isfile(completed_flag), (
        f"Completed flag should not exist when pipeline fails, but found at {completed_flag}"
    )
