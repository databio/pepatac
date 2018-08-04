# This script reads a picard metrics file and calculates
# the number of aligned reads AFTER duplicate removal. run it like:
# awk -F'\t' -f extract_post_dup_aligned_reads.awk metrics_file.txt

/## METRICS CLASS/ { 
  for(i=1; i<=2; i++) {
    getline;
    c=-1;
    d=-1;
    # Get the columns of interest
    for(j=1; j<=NF; j++) { 
      if ($j == "READ_PAIRS_EXAMINED") c=j
      if ($j == "READ_PAIR_DUPLICATES") d=j
    }
    if (c == -1 && d == -1) {
      for(j=1; j<=NF; j++) { 
        if ($j == "UNPAIRED_READS_EXAMINED") c=j
        if ($j == "UNPAIRED_READ_DUPLICATES") d=j
      }
    }
    
    if (c != -1 && d != -1) {
    while(getline && $0 != "") {
      if ($c == -1 || $d == -1) {
        print "Could not extract the number of duplicates"
      } else {     
        # Calculate total number of reads remaining after duplicate removal
        t = ($c-$d)*2
      }
    }
    }
  }
  print t
}
