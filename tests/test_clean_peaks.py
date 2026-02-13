"""Unit tests for the rescale() helper in tools/clean_peaks.py.

Cleaning function tests (clean_fseq, clean_bigbed, CLI) are in
test_clean_peaks_regression.py, which uses golden files for exact
output validation.
"""

import os
import sys

import numpy as np

# Add tools directory to path so we can import clean_peaks
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'tools'))
from clean_peaks import rescale


def test_rescale_normal():
    """Verify rescale maps known values correctly."""
    arr = np.array([0.0, 5.0, 10.0])
    result = rescale(arr, after=(0, 100))
    np.testing.assert_allclose(result, [0.0, 50.0, 100.0])


def test_rescale_zero_range():
    """When all input values are the same, rescale returns input unchanged."""
    arr = np.array([5.0, 5.0, 5.0])
    result = rescale(arr, after=(0, 1000))
    np.testing.assert_array_equal(result, arr)


def test_rescale_custom_before():
    """Verify rescale with explicit before range."""
    arr = np.array([2.0, 4.0, 6.0])
    result = rescale(arr, after=(0, 100), before=(0, 10))
    np.testing.assert_allclose(result, [20.0, 40.0, 60.0])
