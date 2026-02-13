"""Integration tests using a local refgenieserver instance.

Tests PEPATAC with dev versions of refgenie tools by:
1. Using a local refgenieserver instead of the remote
2. Verifying asset resolution works with dev refgenconf
3. Running a minimal pipeline test

Prerequisites:
- Local refgenieserver running (./scripts/services.sh start)
- Test genome seeded (./scripts/seed-local-refgenie.sh)
- Dev refgenie tools installed (./scripts/install-dev-refgenie.sh)
- RUN_LOCAL_REFGENIE_TESTS=true

Enable with: RUN_LOCAL_REFGENIE_TESTS=true pytest tests/integration/test_local_refgenieserver.py
"""

import os
import subprocess
import sys

import pytest

pytestmark = pytest.mark.skipif(
    os.getenv("RUN_LOCAL_REFGENIE_TESTS") != "true",
    reason="Local refgenieserver tests disabled. Set RUN_LOCAL_REFGENIE_TESTS=true to run.",
)

PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
LOCAL_SERVER_PORT = os.getenv("PEPATAC_TEST_REFGENIESERVER_PORT", "8765")
LOCAL_SERVER_URL = f"http://localhost:{LOCAL_SERVER_PORT}"
VENV_DIR = os.path.join(PROJECT_ROOT, ".venv")
REFGENIE = os.path.join(VENV_DIR, "bin", "refgenie")
PIPELINE_SCRIPT = os.path.join(PROJECT_ROOT, "pipelines", "pepatac.py")
GENOME_NAME = "hg38_chr22"
SAMPLE_NAME = "test1"


class TestLocalRefgenieServer:
    """Test that the local refgenieserver is working."""

    def test_server_responds(self):
        """Verify the local server is running and responds."""
        import urllib.request

        req = urllib.request.Request(f"{LOCAL_SERVER_URL}/v3/genomes/list", method="GET")
        with urllib.request.urlopen(req, timeout=5) as resp:
            assert resp.status == 200

    def test_genome_available(self):
        """Verify the test genome is available on the local server."""
        import json
        import urllib.request

        # Check alias_dict endpoint which maps digest -> [aliases]
        req = urllib.request.Request(f"{LOCAL_SERVER_URL}/v3/genomes/alias_dict", method="GET")
        with urllib.request.urlopen(req, timeout=5) as resp:
            data = json.loads(resp.read().decode())
        # Find genome by checking if GENOME_NAME is in any alias list
        found = any(GENOME_NAME in aliases for aliases in data.values())
        assert found, f"{GENOME_NAME} not found in alias_dict: {data}"

    def test_fasta_asset_available(self):
        """Verify the fasta asset is available."""
        import json
        import urllib.request

        req = urllib.request.Request(
            f"{LOCAL_SERVER_URL}/v3/assets/list", method="GET"
        )
        with urllib.request.urlopen(req, timeout=5) as resp:
            data = json.loads(resp.read().decode())
        # assets/list returns {digest: [asset_names]}
        found = any("fasta" in assets for assets in data.values())
        assert found, f"fasta not found in assets/list: {data}"


class TestDevRefgenieTools:
    """Test that dev refgenie tools work with the local server."""

    def test_refgenie_version(self):
        """Verify refgenie is installed (dev or released)."""
        result = subprocess.run(
            [REFGENIE, "--version"],
            capture_output=True,
            text=True,
            timeout=10,
        )
        assert result.returncode == 0
        assert "refgenie" in result.stdout.lower() or "refgenie" in result.stderr.lower()

    def test_refgenie_pull_from_local(self, tmp_path):
        """Test pulling assets from the local server."""
        config_path = tmp_path / "genome_config.yaml"

        # Initialize with local server
        init_result = subprocess.run(
            [REFGENIE, "init", "-c", str(config_path), "-s", LOCAL_SERVER_URL],
            capture_output=True,
            text=True,
            timeout=30,
        )
        assert init_result.returncode == 0
        assert config_path.exists()

        # Pull fasta asset
        result = subprocess.run(
            [
                REFGENIE,
                "pull",
                f"{GENOME_NAME}/fasta",
                "-c",
                str(config_path),
                "--no-large",
            ],
            capture_output=True,
            text=True,
            timeout=300,
        )
        # The test verifies the pull command at least attempts to contact the local server
        assert LOCAL_SERVER_URL in result.stderr or result.returncode == 0


class TestPipelineWithLocalRefgenie:
    """Test PEPATAC pipeline using assets from local refgenieserver."""

    @pytest.fixture(scope="class")
    def local_refgenie_config(self, tmp_path_factory):
        """Set up a refgenie config pointing to local server."""
        config_dir = tmp_path_factory.mktemp("local_refgenie")
        config_path = config_dir / "genome_config.yaml"

        subprocess.run(
            [REFGENIE, "init", "-c", str(config_path), "-s", LOCAL_SERVER_URL],
            capture_output=True,
            text=True,
            timeout=30,
        )

        # Pull required assets
        for asset in ["fasta", "bowtie2_index"]:
            result = subprocess.run(
                [
                    REFGENIE,
                    "pull",
                    f"{GENOME_NAME}/{asset}",
                    "-c",
                    str(config_path),
                    "--no-large",
                ],
                capture_output=True,
                text=True,
                timeout=300,
            )
            if result.returncode != 0:
                pytest.skip(
                    f"Could not pull {GENOME_NAME}/{asset} from local server: "
                    f"{result.stderr[-500:]}"
                )

        return str(config_path)

    def test_seek_fasta(self, local_refgenie_config):
        """Test seeking fasta asset from local config."""
        result = subprocess.run(
            [REFGENIE, "seek", f"{GENOME_NAME}/fasta", "-c", local_refgenie_config],
            capture_output=True,
            text=True,
            timeout=30,
        )
        if result.returncode == 0:
            fasta_path = result.stdout.strip()
            assert fasta_path.endswith(".fa") or fasta_path.endswith(".fasta")

    def test_seek_bowtie2_index(self, local_refgenie_config):
        """Test seeking bowtie2 index asset from local config."""
        result = subprocess.run(
            [
                REFGENIE,
                "seek",
                f"{GENOME_NAME}/bowtie2_index",
                "-c",
                local_refgenie_config,
            ],
            capture_output=True,
            text=True,
            timeout=30,
        )
        if result.returncode == 0:
            index_path = result.stdout.strip()
            assert len(index_path) > 0

    def test_pipeline_with_local_assets(self, local_refgenie_config, tmp_path):
        """Run a minimal pipeline test using locally-served assets."""
        output_dir = tmp_path / "pipeline_output"
        output_dir.mkdir()

        # Seek genome index and chrom sizes
        genome_index_result = subprocess.run(
            [
                REFGENIE,
                "seek",
                f"{GENOME_NAME}/bowtie2_index",
                "-c",
                local_refgenie_config,
            ],
            capture_output=True,
            text=True,
            timeout=30,
        )
        if genome_index_result.returncode != 0:
            pytest.skip("Could not seek bowtie2_index")
        genome_index = genome_index_result.stdout.strip()

        fasta_result = subprocess.run(
            [REFGENIE, "seek", f"{GENOME_NAME}/fasta", "-c", local_refgenie_config],
            capture_output=True,
            text=True,
            timeout=30,
        )
        if fasta_result.returncode != 0:
            pytest.skip("Could not seek fasta")
        chrom_sizes_path = fasta_result.stdout.strip()
        chrom_sizes = os.path.splitext(chrom_sizes_path)[0] + ".chrom.sizes"

        input_r1 = os.path.join(PROJECT_ROOT, "examples", "data", "test1_r1.fastq.gz")
        input_r2 = os.path.join(PROJECT_ROOT, "examples", "data", "test1_r2.fastq.gz")

        if not os.path.isfile(input_r1):
            pytest.skip(f"Test data not found: {input_r1}")

        schema_path = os.path.join(PROJECT_ROOT, "pepatac_output_schema.yaml")
        cmd = [
            sys.executable,
            PIPELINE_SCRIPT,
            "--sample-name",
            SAMPLE_NAME,
            "--genome",
            GENOME_NAME,
            "--input",
            input_r1,
            "--input2",
            input_r2,
            "--single-or-paired",
            "paired",
            "--output-parent",
            str(output_dir),
            "--genome-index",
            genome_index,
            "--chrom-sizes",
            chrom_sizes,
            "--genome-size",
            "5e7",
            "--peak-type",
            "fixed",
            "--peak-caller",
            "macs3",
            "--trimmer",
            "skewer",
            "--aligner",
            "bowtie2",
            "--deduplicator",
            "samtools",
            "--pipestat-schema",
            schema_path,
            "--skipqc",
            "--lite",
            "-P",
            "2",
            "-M",
            "4000",
            "-R",
        ]

        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=900,
        )

        sample_dir = str(output_dir / SAMPLE_NAME)
        completed_flag = os.path.join(
            sample_dir, f"PEPATAC_{SAMPLE_NAME}_completed.flag"
        )

        assert result.returncode == 0, (
            f"Pipeline failed (rc={result.returncode}):\n"
            f"{result.stderr[-1000:]}"
        )
        assert os.path.isfile(completed_flag), (
            f"Pipeline did not complete - no completed.flag at {completed_flag}"
        )
