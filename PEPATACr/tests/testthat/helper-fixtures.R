# Make internal function available to all tests
yamlToDT <- PEPATACr:::yamlToDT

# Fixture: scalars only (no object-type fields) -- the happy path
make_scalar_only_yaml <- function() {
  list(PEPATAC = list(sample = list(
    sample1 = list(
      Raw_reads = 25000, Aligned_reads = 500, Alignment_rate = 2.0,
      Peak_count = 19, FRiP = 0.108, Genome = "hg38",
      Time = "0:00:27", Success = "02-13-18:32:54"
    )
  )))
}

# Fixture: mixed scalars + ONE object field (pre-bug state, already in remove_cols)
make_one_object_yaml <- function() {
  yaml <- make_scalar_only_yaml()
  yaml$PEPATAC$sample$sample1$`Fragment distribution` <- list(
    path = "/path/to/frag.pdf",
    thumbnail_path = "/path/to/frag.png",
    title = "Fragment distribution"
  )
  yaml
}

# Fixture: mixed scalars + NEW object fields (the bug trigger)
# Includes Motif analysis, Library complexity, TSS enrichment --
# the three fields added in commit 60b8635 that are NOT in remove_cols
make_bug_trigger_yaml <- function() {
  yaml <- make_one_object_yaml()
  s <- yaml$PEPATAC$sample$sample1
  s$`Library complexity` <- list(
    path = "/path/to/lib.pdf", thumbnail_path = "/path/to/lib.png",
    title = "Library complexity"
  )
  s$`TSS enrichment` <- list(
    path = "/path/to/tss.pdf", thumbnail_path = "/path/to/tss.png",
    title = "TSS enrichment"
  )
  s$`Motif analysis` <- list(
    path = "/path/to/motif.html", title = "Motif analysis",
    thumbnail_path = "/path/to/motif.png"
  )
  s$meta <- list(
    pipestat_modified_time = "2026-02-13 18:32:54",
    pipestat_created_time = "2026-02-13 18:32:27"
  )
  # Also add all the other object types that ARE in remove_cols
  s$`Peak chromosome distribution` <- list(
    path = "/p.pdf", thumbnail_path = "/p.png", title = "Peak chromosome distribution"
  )
  s$`Peak partition distribution` <- list(
    path = "/p.pdf", thumbnail_path = "/p.png", title = "Peak partition distribution"
  )
  s$cFRiF <- list(path = "/p.pdf", thumbnail_path = "/p.png", title = "cFRiF")
  s$FRiF <- list(path = "/p.pdf", thumbnail_path = "/p.png", title = "FRiF")
  s$`FastQC report r1` <- list(path = "/p.html", thumbnail_path = "/p.png", title = "FastQC r1")
  s$`FastQC report r2` <- list(path = "/p.html", thumbnail_path = "/p.png", title = "FastQC r2")
  s$`TSS distance distribution` <- list(
    path = "/p.pdf", thumbnail_path = "/p.png", title = "TSS distance distribution"
  )
  yaml$PEPATAC$sample$sample1 <- s
  yaml
}

# Fixture: multiple samples with varying completeness
make_multi_sample_yaml <- function() {
  yaml <- make_bug_trigger_yaml()
  # sample2: complete but different values
  yaml$PEPATAC$sample$sample2 <- yaml$PEPATAC$sample$sample1
  yaml$PEPATAC$sample$sample2$Raw_reads <- 50000
  yaml$PEPATAC$sample$sample2$Aligned_reads <- 1200
  # sample3: incomplete -- missing some fields (simulates partial pipeline run)
  yaml$PEPATAC$sample$sample3 <- list(
    Raw_reads = 30000, Aligned_reads = 800,
    Genome = "hg38", meta = list(pipestat_modified_time = "2026-02-13")
  )
  yaml
}
