# Refgenie1 migration findings

This file captures every gap, awkward call pattern, error message, naming
divergence, and missing API encountered while migrating PEPATAC from
`refgenconf` (legacy refgenie) to `refgenie` 1.0 (refgenie1) on the
`refgenie1` branch. It is the deliverable of the dogfooding phase.

Each finding records: (1) what happened, (2) verbatim error/symptom (when
applicable), (3) which refgenie1 file(s) are involved, (4) recommended
one-line fix.

## Audit (initial)

Output of `tools/audit_refgenie_surface.sh` run from the repo root on the
`refgenie1` branch (created off `dev` @ `027b757`). 61 hits total across
20 files. Categorized below.

- **(a) Python imports / call sites:** `pipelines/pepatac.py:21` ONLY
  (`from refgenconf import RefGenConf as RGC, select_genome_config`).
  Names `RGC` and `select_genome_config` are never referenced anywhere
  else in `pepatac.py`. The import is purely dead code. Removed.
- **(b) Pipeline interface declarations:**
  - `sample_pipeline_interface.yaml:51` — `var_templates.refgenie_config: "$REFGENIE"`
  - `sample_pipeline_interface.yaml:54` — `pre_submit.python_functions: - refgenconf.looper_refgenie_populate`
  - Jinja templates use `refgenie[g].fasta.{fasta,chrom_sizes}`,
    `refgene_anno.refgene_tss`, `blacklist.blacklist`,
    `feat_annotation.feat_annotation`, `bowtie2_index.dir`,
    `bwa_index.dir`, `tallymer_index.search_file`, plus `[p]` versions
    for prealignments.
  - `project_pipeline_interface.yaml`: NO refgenie/refgenconf references.
  - `pipelines/pepatac.yaml:37`: `genome_config: ${REFGENIE}` — pypiper
    resource config field, unused; migrated for consistency.
- **(c) Documentation:** `docs/{tutorial,run-conda,detailed-install,run-bulker,assets}.md`,
  `docs/howto/install-refgenie.md`, `docs/changelog.md`. All instruct
  legacy refgenie syntax. Migrated.
- **(d) Example configs:** searched
  `examples/test_project/test_refgenie_pep_config.yaml`,
  `examples/test_project/.looper_test.yaml`,
  `examples/tutorial/.looper_tutorial_refgenie.yaml`,
  `examples/gold_atac/metadata/*` — none directly reference `$REFGENIE`.
- **(e) Test fixtures:** `tests/integration/*.py`, `tests/README.md` —
  use the legacy CLI in a venv. Gated by `RUN_LOCAL_REFGENIE_TESTS=true`,
  skipped by default. Logged as a follow-up rewrite.
- **(f) Requirements:** `requirements.txt:20` (`refgenconf>=0.12.2`),
  `requirements-conda.yml:525` (`refgenconf==0.12.2`). No setup.py /
  pyproject.toml dep. Both swapped to `refgenie>=1.0.0`.
- **(g) Other:** `docs/changelog.md:218` — historical note, left alone.

### Audit findings beyond the plan's expectations

- `pipelines/pepatac.yaml:37` — pypiper resource config field with
  `${REFGENIE}` was not flagged by the plan. Migrated to
  `${REFGENIE_DB_CONFIG_PATH}`.

## API gaps

### Missing `list_seek_keys_values` equivalent

Refgenconf's `rgc.list_seek_keys_values()` returned the full
`{genome: {asset: {tag: {seek_key: path}}}}` shape in one call —
exactly what the legacy populator needs. Refgenie1 has no equivalent.
The local populator must walk `r.alias.list_all()` →
`r.asset.list_groups(genome_names=[g])` →
`r.asset.list_assets(genome_names=[g], asset_group_name=ag)` →
`asset.seek_keys` → `r.asset.seek(g, ag, asset_name, sk_name)` per
leaf. O(genomes * groups * assets * seek_keys) Python-level loop with
one `seek` call per leaf vs. refgenconf's single YAML walk.

**Recommended fix:** add `Refgenie.list_seek_keys_values()` to refgenie1
returning the same shape, populated in one DB walk via the existing
`selectinload(Asset.seek_keys)` already used in `list_assets`.
Refgenie1 file: `refgenie/refgenie/managers/asset/manager.py`.

### `Path` vs `str` returns

`r.asset.seek(...)` returns `pathlib.Path` for path seek_keys
(`refgenie/managers/asset/manager.py:1267`). Refgenconf returned
`str`. The populator must `str(...)` every leaf or Jinja templating
renders `Path.repr` which can confuse JSON-serializing downstreams.

**Recommended fix:** make `Refgenie.asset.seek` return `str` to match
legacy semantics, OR document the divergence prominently in the
refgenie1 README.

### Default-asset selection split across methods

The populator needs the *default* asset name per (genome, asset_group)
to walk that asset's seek_keys. `seek()` defaults internally via
`get_default()`, but the populator needs the *name* to enumerate seek
keys, so it calls `r.asset.get_default(asset_group, genome)`
explicitly. Awkward — having `seek()` default but no public way to
get "the asset that would be used" without a separate manager call.

**Recommended fix:** expose
`AssetManager.list_seek_keys(genome, asset_group, asset_name=None)`
that defaults `asset_name` the same way `seek()` does. Saves a
two-step dance.

## Seek-key naming divergences

| PEPATAC reference                              | Legacy | Refgenie1                                    | Action |
|------------------------------------------------|--------|-----------------------------------------------|--------|
| `refgenie[g].fasta.fasta`                      | OK     | `fasta.fasta` (default)                       | none   |
| `refgenie[g].fasta.chrom_sizes`                | OK     | `fasta.chrom_sizes`                           | none   |
| `refgenie[g].refgene_anno.refgene_tss`         | OK     | `refgene_anno.refgene_tss`                    | none   |
| `refgenie[g].blacklist.blacklist`              | OK     | `blacklist.blacklist`                         | none   |
| `refgenie[g].feat_annotation.feat_annotation`  | OK     | `feat_annotation.feat_annotation`             | none   |
| `refgenie[g].bowtie2_index.dir`                | OK     | **`bowtie2_index.bowtie2_index`** (no `dir`!) | rewrite Jinja |
| `refgenie[g].bwa_index.dir`                    | OK     | not registered                                | rewrite Jinja |
| `refgenie[g].tallymer_index.search_file`       | OK     | not registered                                | leave (gated on --sob) |

### `bowtie2_index.dir` does not exist

Refgenconf shipped a built-in `dir` seek_key for every asset that
returned the asset's containing directory. Refgenie1 has no such
convention — seek keys are explicit and declared in the asset class.
The `bowtie2_index` asset class emits seek keys
`bowtie2_index` (the index prefix), `build_timestamp`,
`refgenie_version`, `inputs`, `version`. No `dir`.

For PEPATAC this is fine in spirit: bowtie2 wants a *prefix*, and
`bowtie2_index.bowtie2_index` returns exactly the prefix path
(`<genome_dir>/bowtie2_index/default/<digest>`). PEPATAC's
`--genome-index` accepts this directly — see
`pipelines/pepatac.py:610-620`, which only special-cases trailing `.`
(the legacy `dir` convention). With a prefix path the special case is
skipped and bowtie2 runs against the prefix as expected.

**Resolution on this branch:** rewrote Jinja to use
`refgenie[g].bowtie2_index.bowtie2_index`.

**Recommended upstream fix:** add a `dir` seek_key to all `*_index`
asset classes in `refgenie/repos/recipes` that emits the asset's
parent directory. This restores the legacy convention as a portable
contract.

### `bwa_index` / `tallymer_index` not registered

PEPATAC supports BWA as alternative aligner and tallymer for
`--sob`. Neither is registered for hg38 in the deployed refgenie1
instance, and `tallymer_index` has no asset class shipped in
`repos/recipes`. Jinja `is defined` guards already gate these
references — they only render when the user enables the corresponding
flag. Validation uses bowtie2 + no `--sob`, neither path exercised.

**Recommended fix:** ship `tallymer_index` and `bwa_index` asset
classes in `refgenie/repos/recipes`. Out of scope for this plan.

## Asset class / recipe gaps

- `bowtie2_index` (and any other `*_index`) asset class lacks `dir`
  seek_key. Documented above.
- `tallymer_index` and `bwa_index` asset classes not shipped in
  `repos/recipes`.

## CLI / install gaps

### `refgenie` PyPI name collision

Both legacy refgenie (0.12.x) and refgenie1 (1.0.x) ship to PyPI
under the name `refgenie`. `pip install refgenie>=1.0.0` is
unambiguous, but `pip install refgenie` cold gives wildly different
behavior. PEPATAC's `requirements.txt` now pins `refgenie>=1.0.0`.
On Rivanna, refgenie1 is in its own venv and on PATH via
`refgenie1.env`.

**Recommended fix:** rename refgenie1's PyPI package to `refgenie2`
or `refgenie-next` until the upstream-merge decision lands, OR yank
legacy refgenie from PyPI. The current name collision is a silent
footgun.

### `$REFGENIE` vs `$REFGENIE_DB_CONFIG_PATH`

Legacy: `$REFGENIE` → path to `genome_config.yaml`.
Refgenie1: `$REFGENIE_DB_CONFIG_PATH` → `refgenie_db_config.yaml`,
plus `$REFGENIE_HOME_PATH` for install root.

PEPATAC's pipeline interface used `$REFGENIE` directly. Migrated.
Cluster setup must export both refgenie1 vars.

**Recommended fix:** refgenie1 README should explicitly call out the
env var migration as a breaking change.

### `refgenie pull` removed

Legacy `refgenie pull <g>/<a>` was a one-liner. Refgenie1 splits this
into `refgenie genome init <fasta>` + `refgenie add <g>/<a>
--recipe <r> ...` plus a subscribed source for actual pulls.

**Recommended fix:** ship a `refgenie pull` shim in refgenie1 that
resolves to the equivalent sequence for the common case (subscribed
source, default recipe). Single-command ergonomics matter.

### `refgenie --version` not supported

Legacy refgenie supports `refgenie --version`. Refgenie1 does not:

```
$ refgenie --version
refgenie: error: unrecognized arguments: --version
```

Documented in plan as a CLI gotcha. The plan suggested using
`refgenie --version` in cluster prep (step 8.1) — that check fails.
Worked around with `pip show refgenie | grep Version`.

**Recommended fix:** add `--version` to refgenie1's top-level
argparse (or Typer) parser. Refgenie1 file: `refgenie/cli/cli_pydantic.py`.

### No `refgenie asset list` subcommand

The plan's step 8.1 calls `refgenie asset list --genome hg38`.
There is no `asset` subcommand in refgenie1. Asset listing happens
under `refgenie list -g <genome>`. Worked around in cluster prep.

**Recommended fix:** add `asset` subcommand alias for discoverability,
OR document the legacy → refgenie1 CLI mapping prominently.

## Cluster integration

### Broken legacy `refgenie` binary still on PATH

Legacy refgenie binary at `~/.local/bin/refgenie` is on PATH for
ns5bc on Rivanna and takes priority unless `refgenie1.env` is
sourced. The legacy binary's shebang points at
`/apps/software/standard/core/anaconda/2023.07-py3.11/bin/python`
which no longer exists, so calling it without env-sourcing fails:

```
bash: /home/ns5bc/.local/share/../bin/refgenie:
/apps/software/standard/core/anaconda/2023.07-py3.11/bin/python:
bad interpreter: No such file or directory
```

**Recommended fix:** the refgenie1 deploy plan should remove or
shadow the broken legacy binary on the cluster.

## Local populator placement

The plan offered two placements for `looper_refgenie_populate_local`:

1. Upstream in refgenie1 as `refgenie.populator.looper_refgenie_populate_local`.
2. On the PEPATAC branch as `pepatac.refgenie_populator.looper_refgenie_populate_local`.

**This branch picks option 2** because:
- Refgenie1 has no `populator.py` module yet — the sibling Issue
  #126 plan adds the remote counterpart in that file. Adding the
  local populator upstream now would race with that plan.
- The PEPATAC branch is exploratory; iterating on the populator here
  is faster than round-tripping a refgenie1 PR.
- If/when the upstream populator lands, this branch's populator
  becomes a one-line re-export.

**Recommended follow-up:** once refgenie1's `populator.py` exists
(Issue #126's plan), move `looper_refgenie_populate_local` upstream
as the local-mode sibling of `looper_refgenie_populate_remote`.

## Tests rewrite (out of scope for this branch)

`tests/integration/{conftest.py,test_end_to_end.py,test_looper_run.py,test_local_refgenieserver.py}`
all use the legacy refgenie CLI (looking for `refgenie` in a venv,
calling `refgenie pull`, `refgenie seek -c`, etc.). The
`RUN_LOCAL_REFGENIE_TESTS=true` gate keeps them off by default. They
will need a full rewrite for refgenie1.

**Recommended follow-up:** separate "PEPATAC test rewrite for
refgenie1" plan.

## Performance

Not measured here. Populator runs once per looper invocation against
a small db (4 genomes, ~5 asset groups each). On the dev login node,
populator completes in <1s. Perf comparison vs. refgenconf deferred.

## Error messages

(Filled by the validation run section below as encountered.)

## Validation run

(Filled below by step 9.)
