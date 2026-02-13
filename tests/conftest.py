"""Top-level pytest configuration for PEPATAC tests.

Provides the --keep-test-outputs flag to preserve test outputs for debugging.
When enabled, test outputs are written to tests/test_outputs/ instead of
temp directories, and are preserved across test runs.
"""

import os
import shutil
import pytest


def pytest_addoption(parser):
    """Add custom pytest command-line options."""
    parser.addoption(
        "--keep-test-outputs",
        action="store_true",
        default=False,
        help="Preserve test outputs in tests/test_outputs/ for debugging",
    )


def pytest_configure(config):
    """Clear old test outputs at the start of the test session."""
    if config.getoption("--keep-test-outputs"):
        tests_dir = os.path.dirname(__file__)
        test_outputs_dir = os.path.join(tests_dir, "test_outputs")
        if os.path.exists(test_outputs_dir):
            shutil.rmtree(test_outputs_dir)
        os.makedirs(test_outputs_dir)


@pytest.fixture
def keep_test_outputs(request):
    """Fixture to check if test outputs should be preserved.

    Returns:
        bool: True if --keep-test-outputs flag was passed.
    """
    return request.config.getoption("--keep-test-outputs")


@pytest.fixture(scope="session")
def test_output_factory(request, tmp_path_factory):
    """Factory for creating test output directories.

    Routes to tests/test_outputs/ if --keep-test-outputs is enabled,
    otherwise creates temporary directories that pytest cleans up.

    Args:
        basename: Base name for the output directory.

    Returns:
        Path: Directory path (as pathlib.Path or string).
    """
    keep_outputs = request.config.getoption("--keep-test-outputs")

    def _factory(basename):
        if keep_outputs:
            tests_dir = os.path.dirname(__file__)
            output_dir = os.path.join(tests_dir, "test_outputs", basename)
            os.makedirs(output_dir, exist_ok=True)
            return output_dir
        else:
            return tmp_path_factory.mktemp(basename)

    return _factory
