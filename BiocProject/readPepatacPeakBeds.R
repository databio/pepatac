
readPepatacPeakBedsOld = function(project) {
  # define default column names in GenomicRanges::GRanges objects
  DEFAULT_GRANGES_COLS = c('chr', 'start', 'end')
  # inferring the suffix, which is "peak_calling_" + genome_assembly,
  # see: pepatac.py
  if (length(unique(samples(project)$genome)) != 1)
    stop(paste0("Need one genome assembly, got  ",
                length(unique(samples(project)$genome)),
                ".\nCouldn't infer the path to the files."))
  genome_assembly = unique(samples(project)$genome)
  suffix = paste0("peak_calling_", genome_assembly)
  # inferring prefix, which is "restults_pipeline", 
  # if not profided in PEP config, see: python peppy package
  prefix = ifelse(is.null(config(project)$metadata$results_subdir),
                  "results_pipeline", config(project)$metadata$results_subdir)
  # get output directory from PEP
  outputDir = config(project)$metadata$output_dir
  # get sample names from PEP
  samples_names = samples(project)$sample_name
  # read the data for each sample
  result = lapply(samples_names, function(sample_name) {
    # use the provided arguments to construct the path
    dir = file.path(prefix, sample_name, suffix)
    # find BED files in the path
    bedFiles = list.files(path=dir, pattern="*.bed")
    # get absolute paths to the BED files
    bedFilesAbs = file.path(dir,bedFiles)
    gr = list()
    # for eache BED file for each sample_name
    message("reading ",length(bedFiles)," files for sample: ", sample_name)
    for (i in seq_along(bedFilesAbs)) {
      # read BED file
      df = read.table(bedFilesAbs[i])
      colnames(df)[1:3] = DEFAULT_GRANGES_COLS
      # convert the data.frame to GenomicRanges::GRanges object
      gr[[i]] = GenomicRanges::GRanges(df)
    }
    names(gr) = bedFiles
    return(gr)
  })
  names(result) = samples_names
  return(result)
}

readPepatacPeakBeds = function(project) {
  pytor = function(str) gsub("(\\{.*?)\\.(.*?\\})", "\\1$\\2", str)
  piface = yaml::yaml.load_file(config(project)$metadata$pipeline_interface)
  outputs = piface$pipelines$pepatac.py$outputs
  outputs
  samples(project)[,name := sample_name]
  s = samples(project)
  files = apply(s, 1, function(x) {
    with(list(sample=x), glue::glue(pytor(outputs$peaks_bed)))
    })
  files

  prefix = ifelse(is.null(config(project)$metadata$results_subdir),
                  "results_pipeline", config(project)$metadata$results_subdir)

  d = lapply(file.path(prefix, s$sample_name, files), function(x) {
        DEFAULT_GRANGES_COLS = c('chr', 'start', 'end')
      message("Reading ", x)
        df = data.table::fread(x)
        colnames(df)[1:3] = DEFAULT_GRANGES_COLS
        gr = GenomicRanges::GRanges(df)
        return(gr) }
    )
  names(d) = s$sample_name
  GenomicRanges::GRangesList(d)
}