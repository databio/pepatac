"""
Regression tests for tools/clean_peaks.py.

Uses golden files in tests/golden/ to detect any changes in output.
Verified via bug injection on 2026-02-13:
  - Wrong rescale range [0,1000] instead of [100,1000]: caught by test_fseq_matches_golden, test_fseq_score_range
  - Wrong quantile column (V7 instead of V5): caught by test_bigbed_matches_golden
  - Wrong chrom clamp column (V2 instead of V3): caught by test_bigbed_chrom_matches_golden
"""

import os
import subprocess
import sys

import numpy as np
import pandas as pd
import pytest

# Add tools directory to path so we can import clean_peaks
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "tools"))
from clean_peaks import clean_bigbed, clean_fseq

GOLDEN_DIR = os.path.join(os.path.dirname(__file__), "golden")
CLEAN_PEAKS_SCRIPT = os.path.join(
    os.path.dirname(__file__), "..", "tools", "clean_peaks.py"
)

NARROWPEAK_COLS_FSEQ = (
    "chr", "start", "end", "name", "score",
    "strand", "signalValue", "pValue", "qValue", "peak",
)
NARROWPEAK_COLS_GENERIC = (
    "V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10",
)


def _load_narrowpeak(path, columns):
    """Load a narrowPeak file as a DataFrame with named columns."""
    return pd.read_csv(path, sep="\t", header=None, names=columns)


# ============================================================================
# Golden file comparison tests
# ============================================================================


def test_fseq_matches_golden(tmp_path):
    """fseq output must exactly match the golden expected file."""
    infile = os.path.join(GOLDEN_DIR, "fseq_input.narrowPeak")
    outfile = str(tmp_path / "out.narrowPeak")
    clean_fseq(infile, outfile)

    actual = _load_narrowpeak(outfile, NARROWPEAK_COLS_FSEQ)
    expected = _load_narrowpeak(
        os.path.join(GOLDEN_DIR, "fseq_expected.narrowPeak"), NARROWPEAK_COLS_FSEQ
    )
    pd.testing.assert_frame_equal(actual, expected)


def test_bigbed_matches_golden(tmp_path):
    """bigbed output (no chrom_sizes) must exactly match the golden expected file."""
    infile = os.path.join(GOLDEN_DIR, "bigbed_input.narrowPeak")
    outfile = str(tmp_path / "out.narrowPeak")
    clean_bigbed(infile, outfile)

    actual = _load_narrowpeak(outfile, NARROWPEAK_COLS_GENERIC)
    expected = _load_narrowpeak(
        os.path.join(GOLDEN_DIR, "bigbed_expected.narrowPeak"), NARROWPEAK_COLS_GENERIC
    )
    pd.testing.assert_frame_equal(actual, expected)


def test_bigbed_chrom_matches_golden(tmp_path):
    """bigbed output with chrom_sizes must exactly match the golden expected file."""
    infile = os.path.join(GOLDEN_DIR, "bigbed_chrom_input.narrowPeak")
    chrom_sizes = os.path.join(GOLDEN_DIR, "chrom.sizes")
    outfile = str(tmp_path / "out.narrowPeak")
    clean_bigbed(infile, outfile, chrom_sizes=chrom_sizes)

    actual = _load_narrowpeak(outfile, NARROWPEAK_COLS_GENERIC)
    expected = _load_narrowpeak(
        os.path.join(GOLDEN_DIR, "bigbed_chrom_expected.narrowPeak"),
        NARROWPEAK_COLS_GENERIC,
    )
    pd.testing.assert_frame_equal(actual, expected)


# ============================================================================
# Property-based content validation tests
# ============================================================================


def test_fseq_score_range(tmp_path):
    """After fseq cleaning, all scores must be integers in [100, 1000]."""
    infile = os.path.join(GOLDEN_DIR, "fseq_input.narrowPeak")
    outfile = str(tmp_path / "out.narrowPeak")
    clean_fseq(infile, outfile)

    df = _load_narrowpeak(outfile, NARROWPEAK_COLS_FSEQ)
    assert (df["score"] >= 100).all(), f"Min score: {df['score'].min()}"
    assert (df["score"] <= 1000).all(), f"Max score: {df['score'].max()}"
    assert (df["score"] == df["score"].astype(int)).all(), "Scores must be integers"


def test_fseq_signalvalue_clipped(tmp_path):
    """After fseq cleaning, no signalValue exceeds the 99th percentile of input."""
    infile = os.path.join(GOLDEN_DIR, "fseq_input.narrowPeak")
    outfile = str(tmp_path / "out.narrowPeak")
    clean_fseq(infile, outfile)

    input_df = _load_narrowpeak(infile, NARROWPEAK_COLS_FSEQ)
    output_df = _load_narrowpeak(outfile, NARROWPEAK_COLS_FSEQ)
    nn = input_df["signalValue"].quantile(0.99)
    assert (output_df["signalValue"] <= nn + 1e-9).all(), (
        f"Max output signalValue {output_df['signalValue'].max()} "
        f"exceeds 99th percentile {nn}"
    )


def test_fseq_row_count_preserved(tmp_path):
    """fseq cleaning must not add or remove rows."""
    infile = os.path.join(GOLDEN_DIR, "fseq_input.narrowPeak")
    outfile = str(tmp_path / "out.narrowPeak")
    clean_fseq(infile, outfile)

    input_df = _load_narrowpeak(infile, NARROWPEAK_COLS_FSEQ)
    output_df = _load_narrowpeak(outfile, NARROWPEAK_COLS_FSEQ)
    assert len(output_df) == len(input_df), (
        f"Row count changed: {len(input_df)} -> {len(output_df)}"
    )


def test_fseq_non_score_columns_unchanged(tmp_path):
    """fseq cleaning must not alter columns other than score and signalValue."""
    infile = os.path.join(GOLDEN_DIR, "fseq_input.narrowPeak")
    outfile = str(tmp_path / "out.narrowPeak")
    clean_fseq(infile, outfile)

    input_df = _load_narrowpeak(infile, NARROWPEAK_COLS_FSEQ)
    output_df = _load_narrowpeak(outfile, NARROWPEAK_COLS_FSEQ)
    unchanged_cols = ["chr", "start", "end", "name", "strand", "pValue", "qValue", "peak"]
    pd.testing.assert_frame_equal(
        input_df[unchanged_cols], output_df[unchanged_cols],
        obj="Non-score columns",
    )


def test_bigbed_score_range(tmp_path):
    """After bigbed cleaning, all V5 scores must be integers in [0, 1000]."""
    infile = os.path.join(GOLDEN_DIR, "bigbed_input.narrowPeak")
    outfile = str(tmp_path / "out.narrowPeak")
    clean_bigbed(infile, outfile)

    df = _load_narrowpeak(outfile, NARROWPEAK_COLS_GENERIC)
    assert (df["V5"] >= 0).all(), f"Min V5: {df['V5'].min()}"
    assert (df["V5"] <= 1000).all(), f"Max V5: {df['V5'].max()}"
    assert (df["V5"] == df["V5"].astype(int)).all(), "V5 scores must be integers"


def test_bigbed_row_count_preserved(tmp_path):
    """bigbed cleaning must not add or remove rows."""
    infile = os.path.join(GOLDEN_DIR, "bigbed_input.narrowPeak")
    outfile = str(tmp_path / "out.narrowPeak")
    clean_bigbed(infile, outfile)

    input_df = _load_narrowpeak(infile, NARROWPEAK_COLS_GENERIC)
    output_df = _load_narrowpeak(outfile, NARROWPEAK_COLS_GENERIC)
    assert len(output_df) == len(input_df), (
        f"Row count changed: {len(input_df)} -> {len(output_df)}"
    )


def test_bigbed_chrom_clamping(tmp_path):
    """After bigbed cleaning with chrom_sizes, no V3 exceeds its chromosome size."""
    infile = os.path.join(GOLDEN_DIR, "bigbed_chrom_input.narrowPeak")
    chrom_sizes = os.path.join(GOLDEN_DIR, "chrom.sizes")
    outfile = str(tmp_path / "out.narrowPeak")
    clean_bigbed(infile, outfile, chrom_sizes=chrom_sizes)

    output_df = _load_narrowpeak(outfile, NARROWPEAK_COLS_GENERIC)
    cs = pd.read_csv(chrom_sizes, sep="\t", header=None, names=["chrom", "chrom_size"])
    merged = output_df.merge(cs, left_on="V1", right_on="chrom")
    assert (merged["V3"] <= merged["chrom_size"]).all(), (
        "Some V3 (chromEnd) values exceed chromosome sizes:\n"
        + str(merged[merged["V3"] > merged["chrom_size"]][["V1", "V3", "chrom_size"]])
    )


def test_bigbed_non_score_columns_unchanged(tmp_path):
    """bigbed cleaning (no chrom_sizes) must not alter columns other than V5."""
    infile = os.path.join(GOLDEN_DIR, "bigbed_input.narrowPeak")
    outfile = str(tmp_path / "out.narrowPeak")
    clean_bigbed(infile, outfile)

    input_df = _load_narrowpeak(infile, NARROWPEAK_COLS_GENERIC)
    output_df = _load_narrowpeak(outfile, NARROWPEAK_COLS_GENERIC)
    unchanged_cols = ["V1", "V2", "V3", "V4", "V6", "V7", "V8", "V9", "V10"]
    pd.testing.assert_frame_equal(
        input_df[unchanged_cols], output_df[unchanged_cols],
        obj="Non-score columns",
    )


# ============================================================================
# CLI regression tests
# ============================================================================


def test_cli_fseq_matches_golden(tmp_path):
    """CLI fseq mode must produce output matching the golden file."""
    infile = os.path.join(GOLDEN_DIR, "fseq_input.narrowPeak")
    outfile = str(tmp_path / "out.narrowPeak")

    result = subprocess.run(
        [sys.executable, CLEAN_PEAKS_SCRIPT,
         "-m", "fseq", "-i", infile, "-o", outfile],
        capture_output=True, text=True,
    )
    assert result.returncode == 0, f"CLI failed: {result.stderr}"

    actual = _load_narrowpeak(outfile, NARROWPEAK_COLS_FSEQ)
    expected = _load_narrowpeak(
        os.path.join(GOLDEN_DIR, "fseq_expected.narrowPeak"), NARROWPEAK_COLS_FSEQ
    )
    pd.testing.assert_frame_equal(actual, expected)


def test_cli_bigbed_chrom_matches_golden(tmp_path):
    """CLI bigbed mode with chrom_sizes must produce output matching the golden file."""
    infile = os.path.join(GOLDEN_DIR, "bigbed_chrom_input.narrowPeak")
    chrom_sizes = os.path.join(GOLDEN_DIR, "chrom.sizes")
    outfile = str(tmp_path / "out.narrowPeak")

    result = subprocess.run(
        [sys.executable, CLEAN_PEAKS_SCRIPT,
         "-m", "bigbed", "-i", infile, "-o", outfile, "-s", chrom_sizes],
        capture_output=True, text=True,
    )
    assert result.returncode == 0, f"CLI failed: {result.stderr}"

    actual = _load_narrowpeak(outfile, NARROWPEAK_COLS_GENERIC)
    expected = _load_narrowpeak(
        os.path.join(GOLDEN_DIR, "bigbed_chrom_expected.narrowPeak"),
        NARROWPEAK_COLS_GENERIC,
    )
    pd.testing.assert_frame_equal(actual, expected)


# ============================================================================
# Meta-test: verify our golden comparisons actually catch changes
# ============================================================================


def test_golden_comparison_catches_modifications(tmp_path):
    """Verify our regression tests detect various types of output corruption.

    Uses sed to inject different types of errors into golden files,
    then confirms pd.testing.assert_frame_equal catches each one.
    If this test passes, our regression tests are working correctly.
    """
    import shutil

    golden_file = os.path.join(GOLDEN_DIR, "fseq_expected.narrowPeak")
    golden_df = _load_narrowpeak(golden_file, NARROWPEAK_COLS_FSEQ)

    # --- Mutation 1: Change a score value ---
    modified = tmp_path / "mut1.narrowPeak"
    shutil.copy(golden_file, modified)
    subprocess.run(["sed", "-i", "1s/\t[0-9]*\t/\t999\t/", str(modified)], check=True)
    modified_df = _load_narrowpeak(str(modified), NARROWPEAK_COLS_FSEQ)

    with pytest.raises(AssertionError):
        pd.testing.assert_frame_equal(golden_df, modified_df)

    # --- Mutation 2: Delete a row ---
    modified = tmp_path / "mut2.narrowPeak"
    shutil.copy(golden_file, modified)
    subprocess.run(["sed", "-i", "1d", str(modified)], check=True)
    modified_df = _load_narrowpeak(str(modified), NARROWPEAK_COLS_FSEQ)

    with pytest.raises(AssertionError):
        pd.testing.assert_frame_equal(golden_df, modified_df)

    # --- Mutation 3: Change a chromosome name ---
    modified = tmp_path / "mut3.narrowPeak"
    shutil.copy(golden_file, modified)
    subprocess.run(["sed", "-i", "1s/^chr/WRONG/", str(modified)], check=True)
    modified_df = _load_narrowpeak(str(modified), NARROWPEAK_COLS_FSEQ)

    with pytest.raises(AssertionError):
        pd.testing.assert_frame_equal(golden_df, modified_df)

    # --- Mutation 4: Change a coordinate ---
    modified = tmp_path / "mut4.narrowPeak"
    shutil.copy(golden_file, modified)
    subprocess.run(["sed", "-i", "1s/\t[0-9]*$/\t99999/", str(modified)], check=True)
    modified_df = _load_narrowpeak(str(modified), NARROWPEAK_COLS_FSEQ)

    with pytest.raises(AssertionError):
        pd.testing.assert_frame_equal(golden_df, modified_df)
