"""Consensus peak calling for the PEPATAC project summarizer.

Two selectable methods (``--consensus-method``):

``legacy``
    Faithful reproduction of the released ``collapsePeaks`` (PEPATACr, R):
    per-chromosome self-overlap join, keeping the max-score peak of each
    peak's overlap neighborhood (ORIGINAL boundaries, no merging), then
    keeping peaks present in ``>= min_samples`` samples with
    ``score >= min_score``. Use this to reproduce pre-existing consensus peak
    sets exactly. This is the current default for backward compatibility; a
    future release is expected to default to ``reproducible`` and eventually
    drop ``legacy``.

``reproducible`` (new)
    Same boundary-preserving grouping, but inclusion is gated by cross-sample
    REPRODUCIBILITY rather than a hard score floor. A peak that is called in a
    high fraction of samples is kept even if individually weak -- recovering
    the real-but-low-score peaks that ``min_score`` discards -- while
    non-reproducible noise is still filtered (noise is not consistently
    called). ``min_score`` becomes an optional user floor that reproducibility
    overrides by default. Writes a confidence sidecar
    (``*_consensusPeaks_confidence.tsv``) with the reproducibility statistic
    and sample count per peak. (Signal-centeredness / bimodality annotations
    and optional summit-recentering are added once signal tracks are wired in.)

Rationale for these choices is documented in dev/consensus_bakeoff/ (the
four-method bake-off + ENCODE cCRE benchmark): ``legacy`` has the best
precision but leaves recoverable peaks on the table because of the score
floor; reproducibility-gating closes that sensitivity gap without the
precision loss of simply lowering ``min_score``. This module is pure-Python
(no gtars ``reduce()``), which also removes the region-bloat failure mode of
the previous ``reduce()``-based implementation.
"""

from pathlib import Path
from collections import defaultdict
import bisect

try:
    import pyBigWig
    import numpy as _np
    _HAVE_SIGNAL = True
except ImportError:                      # signal annotations are optional
    _HAVE_SIGNAL = False

LEGACY = "legacy"
REPRODUCIBLE = "reproducible"
_BC_BIMODAL = 0.555      # bimodality coefficient above uniform => two-moded


def parse_narrowpeak_line(line):
    """Parse a narrowPeak line -> (chrom, start, end, name, score, full_line)."""
    parts = line.rstrip("\n").split("\t")
    chrom = parts[0]
    start = int(parts[1])
    end = int(parts[2])
    name = parts[3] if len(parts) > 3 else "."
    score = float(parts[4]) if len(parts) > 4 and parts[4] not in (".", "") else 0.0
    return chrom, start, end, name, score, line.rstrip("\n")


def _overlaps(a_start, a_end, b_start, b_end, min_olap):
    return min(a_end, b_end) - max(a_start, b_start) >= min_olap


def _collapse_one_genome(peak_files, sample_names, min_olap):
    """Boundary-preserving local-max collapse (the shared core of both methods,
    faithful to collapsePeaks/hit_aggregator).

    Returns a list of survivor dicts, each:
        {chrom, start, end, name, score, line, samples (set of sample ids)}
    where ``samples`` is the set of distinct samples with a peak overlapping
    this survivor (the reproducibility support).
    """
    # Read every peak, tagged with its sample id.
    peaks = []  # (chrom, start, end, name, score, line, sample_id)
    for sid, (pf, _sample) in enumerate(zip(peak_files, sample_names)):
        try:
            with open(pf) as fh:
                for line in fh:
                    if not line.strip():
                        continue
                    c, s, e, nm, sc, full = parse_narrowpeak_line(line)
                    peaks.append((c, s, e, nm, sc, full, sid))
        except (FileNotFoundError, IOError):
            continue

    if len(peaks) < 2:
        return []

    by_chrom = defaultdict(list)
    for p in peaks:
        by_chrom[p[0]].append(p)

    max_span = max((p[2] - p[1] for p in peaks), default=1000)
    survivors = []

    for chrom, cps in by_chrom.items():
        cps.sort(key=lambda p: p[1])
        starts = [p[1] for p in cps]
        n = len(cps)

        # For each peak, find the max-score peak in its overlap neighborhood;
        # survivors = the union of those argmaxes (collapsePeaks semantics).
        keep_idx = set()
        for i in range(n):
            si, ei, sci = cps[i][1], cps[i][2], cps[i][4]
            best_j, best_score = i, sci
            j = i - 1
            while j >= 0 and starts[i] - starts[j] <= max_span:
                if _overlaps(si, ei, cps[j][1], cps[j][2], min_olap) and cps[j][4] > best_score:
                    best_j, best_score = j, cps[j][4]
                j -= 1
            j = i + 1
            while j < n and cps[j][1] <= ei:
                if _overlaps(si, ei, cps[j][1], cps[j][2], min_olap) and cps[j][4] > best_score:
                    best_j, best_score = j, cps[j][4]
                j += 1
            keep_idx.add(best_j)

        # Reproducibility support: distinct samples overlapping each survivor.
        for i in sorted(keep_idx):
            c, s, e, nm, sc, full, _sid = cps[i]
            lo = bisect.bisect_left(starts, s - max_span)
            samples = set()
            k = lo
            while k < n and cps[k][1] <= e:
                if _overlaps(s, e, cps[k][1], cps[k][2], min_olap):
                    samples.add(cps[k][6])
                k += 1
            survivors.append({
                "chrom": c, "start": s, "end": e, "name": nm,
                "score": sc, "line": full, "samples": samples,
            })

    return survivors


def collapse_peaks(
    peak_files,
    sample_names,
    chrom_sizes=None,
    min_samples=2,
    min_score=5.0,
    min_olap=1,
    method=LEGACY,
    repro_cutoff=0.6,
):
    """Collapse per-sample peaks into a consensus set.

    Args:
        peak_files: narrowPeak file paths.
        sample_names: corresponding sample names.
        chrom_sizes: unused (accepted for signature compatibility).
        min_samples: minimum distinct samples a peak must appear in.
        min_score: score floor. In ``legacy`` this is a hard cutoff (default 5).
            In ``reproducible`` it is an OPTIONAL extra floor (default 0 = off).
        min_olap: minimum overlap in bp to consider two peaks overlapping.
        method: ``legacy`` or ``reproducible``.
        repro_cutoff: reproducible mode only -- keep a peak whose reproducibility
            (fraction of samples it is called in) is >= this value, regardless
            of score. Default 0.6 (present in >= 60% of samples). Tunable.

    Returns:
        (consensus_lines, confidence_rows) where consensus_lines are narrowPeak
        strings and confidence_rows are (chrom, start, end, name, n_samples,
        reproducibility, score) tuples for the sidecar.
    """
    n_total = len(sample_names)
    survivors = _collapse_one_genome(peak_files, sample_names, min_olap)

    consensus_lines = []
    confidence_rows = []
    seen = set()
    for sv in survivors:
        k = len(sv["samples"])
        if k < min_samples:
            continue
        repro = k / n_total if n_total else 0.0

        if method == REPRODUCIBLE:
            # Reproducibility is primary; min_score is an optional user floor.
            keep = repro >= repro_cutoff
            if min_score > 0:
                keep = keep and sv["score"] >= min_score
        else:  # LEGACY: hard score floor (released behavior)
            keep = sv["score"] >= min_score

        if not keep:
            continue
        line = sv["line"]
        if line in seen:
            continue
        seen.add(line)
        consensus_lines.append(line)
        confidence_rows.append(
            (sv["chrom"], sv["start"], sv["end"], sv["name"], k, round(repro, 3),
             sv["score"])
        )

    return consensus_lines, confidence_rows


# --------------------------------------------------------------------------- #
# Optional signal-based confidence annotations (offset, bimodality)
# --------------------------------------------------------------------------- #

def _resolve_signal_tracks(results_path, sample_names, genome):
    """Locate each sample's coverage bigWig. Prefer the UNSMOOTHED exact track
    (better for bimodality; smoothing blurs two close modes), else the smoothed
    track. Returns the list of existing paths (may be shorter than samples)."""
    tracks = []
    for s in sample_names:
        exact = results_path / s / f"aligned_{genome}_exact" / f"{s}_exact_shift.bw"
        smooth = results_path / s / f"aligned_{genome}" / f"{s}_smooth_shift.bw"
        if exact.exists():
            tracks.append(str(exact))
        elif smooth.exists():
            tracks.append(str(smooth))
    return tracks


def _signal_profile(bws, chrom, start, end):
    """Summed per-base coverage over [start, end) across the sample bigWigs."""
    prof = _np.zeros(end - start, dtype=float)
    for bw in bws:
        chroms = bw.chroms()
        if chrom not in chroms:
            continue
        e = min(end, chroms[chrom])
        if e <= start:
            continue
        vals = _np.nan_to_num(_np.array(bw.values(chrom, start, e), dtype=float))
        prof[:e - start] += vals
    return prof


def _offset_bimodality(prof):
    """(offset, bimodality_coefficient, empty) for one peak's signal profile.

    offset: signal-max position vs peak center, in [-1, 1] (0 = centered).
    bimodality: BC = (skew^2 + 1)/kurtosis of the in-peak signal; > 0.555
        suggests two fused peaks. NaN if undefined.
    """
    W = prof.sum()
    if W <= 0:
        return 0.0, float("nan"), True
    n = len(prof)
    center = n / 2.0
    offset = (int(_np.argmax(prof)) - center) / center if center else 0.0
    pos = _np.arange(n, dtype=float)
    m = (prof * pos).sum() / W
    d = pos - m
    var = (prof * d**2).sum() / W
    if var <= 0:
        return offset, float("nan"), False
    skew = (prof * d**3).sum() / W / var**1.5
    kurt = (prof * d**4).sum() / W / var**2
    bc = (skew**2 + 1) / kurt if kurt > 0 else float("inf")
    return offset, bc, False


def _rewrite_coords(line, start, end, summit_offset):
    """Return a narrowPeak line with updated start/end (and summit col 10)."""
    f = line.split("\t")
    f[1] = str(start)
    f[2] = str(end)
    if len(f) >= 10:
        f[9] = str(summit_offset)
    return "\t".join(f)


def _recenter_peaks(lines, conf_rows, bws, offset_threshold=0.25):
    """Recenter off-center peaks on their signal max, preserving width.

    Overlap-guard: the shifted window is CLAMPED into the gap between its
    already-placed left neighbor and its original-position right neighbor, and
    the move is only applied if the clamped window fits without overlapping
    either -- so recentering can never create a new overlapping peak. Boxed-in
    peaks (no room) are left in place. Returns (lines, conf_rows, n_moved).
    """
    recs = []
    for line, cr in zip(lines, conf_rows):
        recs.append({"line": line, "chrom": cr[0], "start": cr[1], "end": cr[2],
                     "name": cr[3], "ns": cr[4], "repro": cr[5], "score": cr[6]})

    by_chrom = defaultdict(list)
    for i, r in enumerate(recs):
        by_chrom[r["chrom"]].append(i)

    n_moved = 0
    for chrom, idxs in by_chrom.items():
        idxs.sort(key=lambda i: recs[i]["start"])
        prev_final_end = -1
        for k, i in enumerate(idxs):
            r = recs[i]
            s, e = r["start"], r["end"]
            w = e - s
            left_bound = prev_final_end
            right_bound = (recs[idxs[k + 1]]["start"] if k + 1 < len(idxs)
                           else None)

            prof = _signal_profile(bws, chrom, s, e)
            if prof.sum() > 0:
                amax = s + int(_np.argmax(prof))
                center = (s + e) / 2.0
                offset = (amax - center) / (w / 2.0)
                if abs(offset) > offset_threshold:
                    new_start = amax - w // 2
                    if new_start < left_bound:
                        new_start = left_bound
                    if right_bound is not None and new_start + w > right_bound:
                        new_start = right_bound - w
                    # apply only if it fits the gap without overlap and moved
                    fits = (new_start >= 0 and new_start >= left_bound and
                            (right_bound is None or new_start + w <= right_bound))
                    if fits and new_start != s:
                        new_end = new_start + w
                        summit = min(max(amax - new_start, 0), w - 1)
                        r["line"] = _rewrite_coords(r["line"], new_start,
                                                    new_end, summit)
                        r["start"], r["end"] = new_start, new_end
                        n_moved += 1
            prev_final_end = r["end"]

    new_lines = [r["line"] for r in recs]
    new_conf = [(r["chrom"], r["start"], r["end"], r["name"], r["ns"],
                 r["repro"], r["score"]) for r in recs]
    return new_lines, new_conf, n_moved


def _summit_abs(line, start):
    """Absolute summit position from a narrowPeak line (col10 offset)."""
    f = line.split("\t")
    if len(f) >= 10 and f[9] not in (".", "", "-1"):
        try:
            return start + int(f[9])
        except ValueError:
            pass
    return None


def _make_distinct(lines, conf_rows, min_width=50):
    """Make the consensus set non-overlapping by TRIMMING overlaps to their
    midpoint (preserving both peaks -- never dropping a real element). Trimmed
    peaks become narrower than the fixed width; a trim is skipped if it would
    shrink either peak below ``min_width`` (the small residual overlap is kept
    instead). Recomputes the summit column. Returns (lines, conf_rows, n_trimmed).
    """
    recs = []
    for line, cr in zip(lines, conf_rows):
        s = cr[1]
        recs.append({"line": line, "chrom": cr[0], "start": s, "end": cr[2],
                     "name": cr[3], "ns": cr[4], "repro": cr[5], "score": cr[6],
                     "summit": _summit_abs(line, s)})

    by_chrom = defaultdict(list)
    for i, r in enumerate(recs):
        by_chrom[r["chrom"]].append(i)

    n_trim = 0
    for chrom, idxs in by_chrom.items():
        idxs.sort(key=lambda i: (recs[i]["start"], recs[i]["end"]))
        for k in range(len(idxs) - 1):
            a, b = recs[idxs[k]], recs[idxs[k + 1]]
            if a["end"] > b["start"]:                     # overlap
                mid = (b["start"] + a["end"]) // 2
                if (mid - a["start"] >= min_width and
                        b["end"] - mid >= min_width):
                    a["end"] = mid
                    b["start"] = mid
                    n_trim += 1

    for r in recs:
        w = r["end"] - r["start"]
        if r["summit"] is not None:
            off = min(max(r["summit"] - r["start"], 0), max(w - 1, 0))
        else:
            off = w // 2
        r["line"] = _rewrite_coords(r["line"], r["start"], r["end"], off)

    new_lines = [r["line"] for r in recs]
    new_conf = [(r["chrom"], r["start"], r["end"], r["name"], r["ns"],
                 r["repro"], r["score"]) for r in recs]
    return new_lines, new_conf, n_trim


def _make_distinct_drop(lines, conf_rows):
    """Make the consensus set non-overlapping by DROPPING the lower-confidence
    peak of each overlap, PRESERVING fixed width (consistent with PEPATAC's
    per-sample overlap handling and the fixed-width count-comparability
    rationale). Greedy: consider peaks by descending confidence (reproducibility,
    then score) and keep a peak only if it does not overlap an already-kept
    peak. Returns (lines, conf_rows, n_dropped)."""
    n = len(lines)
    order = sorted(range(n),
                   key=lambda i: (-conf_rows[i][5], -conf_rows[i][6]))  # repro, score
    kept_starts = defaultdict(list)
    kept_ends = defaultdict(list)
    keep = [False] * n
    for i in order:
        c, s, e = conf_rows[i][0], conf_rows[i][1], conf_rows[i][2]
        starts, ends = kept_starts[c], kept_ends[c]
        idx = bisect.bisect_left(starts, s)
        overlap = ((idx > 0 and ends[idx - 1] > s) or
                   (idx < len(starts) and starts[idx] < e))
        if not overlap:
            keep[i] = True
            starts.insert(idx, s)
            ends.insert(idx, e)
    new_lines = [lines[i] for i in range(n) if keep[i]]
    new_conf = [conf_rows[i] for i in range(n) if keep[i]]
    return new_lines, new_conf, n - len(new_lines)


def calculate_consensus_peaks(
    sample_table,
    summary_dir,
    results_subdir,
    project_name,
    min_samples=2,
    min_score=5.0,
    min_olap=1,
    method=LEGACY,
    repro_cutoff=0.6,
    recenter=False,
    distinct="drop",
):
    """Calculate per-genome consensus peaks for the project.

    Writes ``{project}_{genome}_consensusPeaks.narrowPeak`` and, for the
    ``reproducible`` method, a ``{project}_{genome}_consensusPeaks_confidence.tsv``
    sidecar. If ``recenter`` is set (reproducible + signal tracks available),
    off-center peaks are shifted onto their signal max with an overlap-guard.
    Returns {genome -> consensus peak file}.
    """
    summary_path = Path(summary_dir)
    summary_path.mkdir(exist_ok=True)
    results_path = Path(results_subdir)

    if hasattr(sample_table, "iterrows"):
        samples = [(r["sample_name"], r["genome"]) for _, r in sample_table.iterrows()]
    else:
        samples = [(s, g) for s, g in
                   zip(sample_table["sample_name"], sample_table["genome"])]

    genome_samples = defaultdict(list)
    for sample, genome in samples:
        genome_samples[genome].append(sample)

    consensus_files = {}
    for genome, sample_list in genome_samples.items():
        peak_files, sample_names = [], []
        for sample in sample_list:
            pf = (results_path / sample / f"peak_calling_{genome}" /
                  f"{sample}_peaks_normalized.narrowPeak")
            if pf.exists():
                peak_files.append(str(pf))
                sample_names.append(sample)

        if len(peak_files) < 2:
            print(f"Found only {len(peak_files)} valid peak file(s) for "
                  f"{genome}, skipping consensus.")
            continue

        print(f"Calculating {genome} consensus peak set from "
              f"{len(peak_files)} samples (method={method})...")

        consensus_lines, confidence_rows = collapse_peaks(
            peak_files, sample_names, min_samples=min_samples,
            min_score=min_score, min_olap=min_olap, method=method,
            repro_cutoff=repro_cutoff,
        )

        if not consensus_lines:
            print(f"Warning: No consensus peaks found for {genome}")
            continue

        # Open per-sample signal tracks once (reproducible mode); used for both
        # optional recentering and the confidence annotations.
        bws = []
        if method == REPRODUCIBLE and _HAVE_SIGNAL:
            tracks = _resolve_signal_tracks(results_path, sample_names, genome)
            if tracks:
                bws = [pyBigWig.open(t) for t in tracks]
            elif recenter:
                print("  (no signal tracks found; skipping recentering + "
                      "signal annotations)")

        # Recentering + distinct are reproducible-mode refinements; legacy is
        # left byte-for-byte as the released method.
        if method == REPRODUCIBLE:
            if bws and recenter:
                consensus_lines, confidence_rows, n_moved = _recenter_peaks(
                    consensus_lines, confidence_rows, bws)
                print(f"  recentered {n_moved} off-center peak(s) on signal max "
                      "(overlap-guarded)")

            if distinct == "drop":
                consensus_lines, confidence_rows, n_drop = _make_distinct_drop(
                    consensus_lines, confidence_rows)
                print(f"  dropped {n_drop} lower-confidence overlapping peak(s) "
                      "-> distinct fixed-width set")
            elif distinct == "trim":
                consensus_lines, confidence_rows, n_trim = _make_distinct(
                    consensus_lines, confidence_rows)
                print(f"  trimmed {n_trim} overlap(s) -> distinct peaks "
                      "(both preserved)")

        output_file = summary_path / f"{project_name}_{genome}_consensusPeaks.narrowPeak"
        with open(output_file, "w") as f:
            for line in consensus_lines:
                f.write(line + "\n")
        consensus_files[genome] = str(output_file)
        print(f"Consensus peak set ({len(consensus_lines)} peaks): {output_file}")

        if method == REPRODUCIBLE:
            conf_file = (summary_path /
                         f"{project_name}_{genome}_consensusPeaks_confidence.tsv")
            with open(conf_file, "w") as f:
                header = ["chrom", "start", "end", "name", "n_samples",
                          "reproducibility", "score"]
                if bws:
                    header += ["signal_offset", "bimodality", "high_confidence"]
                f.write("\t".join(header) + "\n")
                for row in confidence_rows:
                    chrom, start, end = row[0], row[1], row[2]
                    out = list(row)
                    if bws:
                        off, bc, empty = _offset_bimodality(
                            _signal_profile(bws, chrom, start, end))
                        centered = abs(off) <= 0.25
                        unimodal = (bc == bc) and bc <= _BC_BIMODAL  # bc==bc: not NaN
                        hi = int(centered and unimodal and not empty)
                        out += [round(off, 3),
                                round(bc, 3) if bc == bc else "NA", hi]
                    f.write("\t".join(str(x) for x in out) + "\n")
            print(f"Consensus confidence sidecar: {conf_file}")

        for bw in bws:
            bw.close()

    return consensus_files
