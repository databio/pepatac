/## METRICS CLASS/ { 
  for(i=1; i<=2; i++) {
    getline;
    c=-1;
    for(j=1; j<=10; j++) { 
      if ($j == "ESTIMATED_LIBRARY_SIZE") c=j 
      }
    if (c != -1) { 
      getline;
      print $c } 
    }
  }