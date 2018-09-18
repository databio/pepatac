# This script reads a picard metrics file and calculates
# the number of aligned reads AFTER duplicate removal. run it like:
# awk -F'\t' -f extract_post_dup_aligned_reads.awk metrics_file.txt

/## METRICS CLASS/ { 
  getline;
  c=-1;
  d=-1;
  e=-1;
  f=-1;
  # Get the columns of interest
  for(j=1; j<=NF; j++) { 
	if ($j == "UNPAIRED_READS_EXAMINED") e=j
    if ($j == "READ_PAIRS_EXAMINED") c=j
	if ($j == "UNPAIRED_READ_DUPLICATES") f=j
    if ($j == "READ_PAIR_DUPLICATES") d=j
  }  
  if (c != -1 && d != -1 && e != -1 && f != -1) {
    while(getline && $0 != "") {
      if ($c == 0 && $d == 0) {
	    # Calculate total number of SE reads remaining after duplicate removal
        t = ($e-$f)*2
      } else {     
        # Calculate total number of PE reads remaining after duplicate removal
        t = ($c-$d)*2
      }
    }
  } else {
	print "Could not extract the number of duplicates"
  }
  print t
}
