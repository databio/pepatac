readPepatacPeakBeds = function(p, pipName="pepatac.py") {
  readBed = function(fp) {
    message("Reading: ", basename(fp))
    df = read.table(s, stringsAsFactors=F)
    colnames(df)[1:3] = c('chr', 'start', 'end')
    GenomicRanges::GRanges(df)
  }
  lapply(outputsByPipeline(p, pipName), function(f) {
      lapply(f, function(s){
          if (!file.exists(s)) {
            warning("File '", s, "' not found")
            NULL
          } else {
            readBed(s)
          }
      })
  })
}
