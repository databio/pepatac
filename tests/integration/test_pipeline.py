"""Integration tests for the PEPATAC pipeline.

Tests pipeline argument parsing, tool resolution, PEP config loading,
and schema validation. Requires bulker crate for tool availability checks.
"""

import os
import subprocess
import sys
import pytest

pytestmark = pytest.mark.skipif(
    os.getenv("RUN_INTEGRATION_TESTS") != "true",
    reason="Integration tests disabled.",
)


class TestArgumentParsing:
    """Test that the pipeline parses valid arguments without errors."""

    def test_help_flag(self, pipelines_dir):
        """Pipeline --help exits cleanly."""
        result = subprocess.run(
            [sys.executable, os.path.join(pipelines_dir, "pepatac.py"), "--help"],
            capture_output=True,
            text=True,
        )
        assert result.returncode == 0
        assert "PEPATAC" in result.stdout

    def test_version_in_help(self, pipelines_dir):
        """Pipeline version string appears in help output."""
        result = subprocess.run(
            [sys.executable, os.path.join(pipelines_dir, "pepatac.py"), "--help"],
            capture_output=True,
            text=True,
        )
        assert "version" in result.stdout.lower()

    def test_collator_help_flag(self, pipelines_dir):
        """Collator --help exits cleanly."""
        result = subprocess.run(
            [sys.executable, os.path.join(pipelines_dir, "pepatac_collator.py"), "--help"],
            capture_output=True,
            text=True,
        )
        assert result.returncode == 0


class TestToolResolution:
    """Test that tool_path resolves correctly and tools exist."""

    def test_tool_path_returns_absolute(self):
        """tool_path() returns an absolute path."""
        from pepatac import tool_path

        path = tool_path("bamQC.py")
        assert os.path.isabs(path)

    def test_tool_path_resolves_known_tools(self, tools_dir):
        """tool_path() resolves paths to known helper scripts."""
        from pepatac import tool_path

        known_tools = ["bamQC.py", "bamSitesToWig.py", "pyTssEnrichment.py"]
        for tool in known_tools:
            path = tool_path(tool)
            assert os.path.isfile(path), f"Tool not found: {path}"

    def test_check_commands_with_bulker_tools(self):
        """check_commands() finds tools available via bulker PATH."""
        from pepatac import check_commands

        # These should be available via the bulker crate
        tools = {"samtools": "samtools", "bedtools": "bedtools"}
        assert check_commands(tools) is True

    def test_check_commands_detects_missing(self):
        """check_commands() returns False for nonexistent tools."""
        from pepatac import check_commands

        tools = {"fake": "definitely_not_a_real_tool_xyz"}
        assert check_commands(tools) is False


class TestPepConfigLoading:
    """Test PEP config parsing for test project configurations."""

    def test_load_microtest_config(self, microtest_dir):
        """Microtest PEP config loads with peppy."""
        import peppy

        config_path = os.path.join(
            os.path.dirname(os.path.dirname(__file__)),
            "microtest_pep_config.yaml",
        )
        if not os.path.isfile(config_path):
            pytest.skip("microtest_pep_config.yaml not found")

        p = peppy.Project(config_path)
        assert len(p.samples) > 0
        assert hasattr(p.samples[0], "sample_name")

    def test_test_project_config(self, project_root):
        """Test project PEP config loads with peppy."""
        import peppy

        config_path = os.path.join(
            project_root, "examples", "test_project", "test_pep_config.yaml"
        )
        if not os.path.isfile(config_path):
            pytest.skip("test_pep_config.yaml not found")

        p = peppy.Project(config_path)
        assert len(p.samples) > 0

    def test_sample_has_required_attributes(self, project_root):
        """Samples have required attributes per the input schema."""
        import peppy

        config_path = os.path.join(
            project_root, "examples", "test_project", "test_pep_config.yaml"
        )
        if not os.path.isfile(config_path):
            pytest.skip("test_pep_config.yaml not found")

        p = peppy.Project(config_path)
        required_attrs = ["sample_name", "read1", "genome"]
        for sample in p.samples:
            for attr in required_attrs:
                assert hasattr(sample, attr), (
                    f"Sample {sample.sample_name} missing required attribute: {attr}"
                )


class TestSchemaValidation:
    """Test that PEP configs validate against the PEPATAC input schema."""

    def test_input_schema_exists(self, project_root):
        """Input schema file exists."""
        schema_path = os.path.join(project_root, "pepatac_input_schema.yaml")
        assert os.path.isfile(schema_path)

    def test_output_schema_exists(self, project_root):
        """Output schema file exists."""
        schema_path = os.path.join(project_root, "pepatac_output_schema.yaml")
        assert os.path.isfile(schema_path)

    def test_validate_test_project_against_schema(self, project_root):
        """Test project validates against the input schema with eido."""
        try:
            import eido
            import peppy
        except ImportError:
            pytest.skip("eido or peppy not installed")

        config_path = os.path.join(
            project_root, "examples", "test_project", "test_pep_config.yaml"
        )
        schema_path = os.path.join(project_root, "pepatac_input_schema.yaml")

        if not os.path.isfile(config_path):
            pytest.skip("test_pep_config.yaml not found")

        p = peppy.Project(config_path)
        # eido.validate_project raises on validation failure
        eido.validate_project(
            project=p,
            schema=schema_path,
        )


class TestBulkerToolAvailability:
    """Verify bioinformatics tools are callable via bulker crate."""

    @pytest.mark.parametrize(
        "tool",
        ["bowtie2", "samtools", "macs3", "skewer", "samblaster", "bedtools"],
    )
    def test_required_tool_on_path(self, tool):
        """Required tool is available on PATH (via bulker)."""
        import shutil

        path = shutil.which(tool)
        assert path is not None, f"{tool} not found on PATH. Is bulker crate active?"

    @pytest.mark.parametrize(
        "tool,version_flag",
        [
            ("samtools", "--version"),
            ("bedtools", "--version"),
        ],
    )
    def test_tool_executes(self, tool, version_flag):
        """Tool executes and returns version info."""
        result = subprocess.run(
            [tool, version_flag],
            capture_output=True,
            text=True,
            timeout=30,
        )
        assert result.returncode == 0
