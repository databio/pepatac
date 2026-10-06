# Refgenie1 validation run notes

This directory captures the end-to-end validation evidence for the
PEPATAC `refgenie1` migration branch. The full migration findings
live in `findings.md` at the repo root; this file records the
specific run.

## Setup

- Cluster: UVA Rivanna (yoke `atacbase` session)
- Refgenie1 brick: `/project/shefflab/brickyard/datasets_downloaded/refgenie1/`
- Refgenie1 venv (also has looper, pypiper, refgenie1):
  `/project/shefflab/brickyard/datasets_downloaded/refgenie1/src/.venv`
- Bulker crate: `databio/pepatac:1.1.0` (samtools, bowtie2, macs3, skewer, etc.)
- Working dir:
  `/project/shefflab/brickyard/results_analysis/atacbase/forge/pilot/refgenie1_validation/`

## Files

- `pep_config.yaml` (under workspace) — PEP config for the validation sample
- `sample_table.csv` — single-sample manifest (test1, ATAC, human, paired-end)
- `looper_test.yaml` — looper config pointing at this branch's pipeline interfaces
- `run_validation.sh` — direct sbatch wrapper that bypasses looper's submit
  script (which uses `srun` and `eval`-mangling that conflicts with bulker
  exec). Source refgenie1.env, then `bulker exec databio/pepatac:1.1.0 --
  python pepatac.py ...` with all paths pre-resolved by the populator.

## Submit-script generation (looper)

Looper itself is exercised in dry-run mode to confirm:

1. `refgenie.looper_refgenie_populate_local` imports cleanly and returns
   the expected `{genome: {asset_group: {seek_key: path}}}` namespace shape.
2. The Jinja templates in `sample_pipeline_interface.yaml` resolve fully
   against that namespace — every `refgenie[g].asset.seek_key` reference
   produces a real cluster path.

The dry-run was `looper run -c looper_test.yaml --dry-run`. It produces
`results_pipeline/submission/PEPATAC_test1.sub` containing the resolved
command. We ran a manual sbatch wrapper rather than letting looper submit,
because (a) the looper-generated submit script wraps every line in `srun`
which doesn't compose cleanly with `bulker exec`, and (b) we needed to
ensure the same Python venv (refgenie1+looper+pypiper) is on PATH inside
the SLURM job.

## Run

See `run_validation.log` on the cluster (path above). Wall-clock and
exit status are summarized in `findings.md` under "Validation run".

## Validation outcome

**Job:** SLURM 12499800, Rivanna node `udc-aw34-12c0`, 4 cores, 12GB.
**Wall-clock:** 2:16. **Peak RSS:** 3.7GB.

**Refgenie1 integration: pass.** The populator delivers a fully-
resolved command line; PEPATAC consumes refgenie1 paths for hg38
(fasta, chrom_sizes, refgene_tss, blacklist, feat_annotation,
bowtie2_index) and rCRSd (fasta, bowtie2_index) without modification
beyond the `bowtie2_index.dir` → `bowtie2_index.bowtie2_index` Jinja
rename.

**Pipeline status: partial.** The pipeline ran successfully through
trimming → fastqc → rCRSd prealignment → hg38 alignment → sort/index
→ dedup → fragment classification. It then failed at signal
generation in `gtars uniwig` with a Rust panic on a BAM header
(`InvalidProgram(InvalidOther(Other("VN"), Missing))`). This is a
gtars-rs / PEPATAC incompatibility unrelated to refgenie1 — see the
"Validation run results" section of `findings.md`.

Artefacts produced on cluster (in
`/project/shefflab/brickyard/results_analysis/atacbase/forge/pilot/refgenie1_validation/results_pipeline/results_pipeline/test1/`):

- `aligned_hg38/test1_sort.bam` (1.1MB, indexed)
- `aligned_hg38/test1_sort_dedup.bam` (indexed)
- `aligned_hg38/test1_{NFR,mono,di,tri,poly}.bam` (fragment classes)
- `prealignments/test1_rCRSd_bt_aln_summary.log`
- `fastqc/` reports
- `PEPATAC_log.md`, `stats.yaml`

