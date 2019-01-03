# [PEPATAC documentation](http://code.databio.org/PEPATAC)

This repository is viewable at [code.databio.org/PEPATAC](http://code.databio.org/PEPATAC). It holds HTML documentation for the PEPATAC pipeline.

## Building PEPATAC documentation with jekyll:

`jekyll build pepatac`

## Do it with `docker` or `singularity`!

1. Grab the container

   `docker pull nsheff/jim`   
   *or*  
   `singularity build jim docker://nsheff/jim`

2. Build the website

   `docker run jim jekyll build pepatac`  
   *or*  
   `singularity exec jim jekyll build pepatac`
