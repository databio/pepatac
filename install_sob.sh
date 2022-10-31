#!/bin/bash

case "$OSTYPE" in
  solaris*) echo "SOLARIS; See https://github.com/guertinlab/seqOutBias for installation." ;;
  darwin*)  wget -O seqOutBias_v1.2.0.tgz https://github.com/guertinlab/seqOutBias/releases/download/v1.2.0/seqOutBias_v1.2.0.bin.osx.x86_64.tgz ;; 
  linux*)   wget -O seqOutBias_v1.2.0.tgz  https://github.com/guertinlab/seqOutBias/releases/download/v1.2.0/seqOutBias_v1.2.0.bin.linux.x86_64.tgz ;;
  bsd*)     echo "BSD; See https://github.com/guertinlab/seqOutBias for installation." ;;
  msys*)    echo "WINDOWS; See https://github.com/guertinlab/seqOutBias for installation." ;;
  *)        echo "unknown: $OSTYPE; See https://github.com/guertinlab/seqOutBias for installation." ;;
esac

if [ -f "seqOutBias_v1.2.0.tgz" ]; then
  ENVS=$(conda env list | awk '{print $1}' )
  if [[ $ENVS = *"pepatac"* ]]; then
    conda activate pepatac
    mkdir seqOutBias_v1.2.0 && tar xvf seqOutBias_v1.2.0.tgz -C seqOutBias_v1.2.0 --strip-components 1
    cd seqOutBias_v1.2.0/
    ln -s `pwd`/seqOutBias $CONDA_PREFIX/bin/seqOutBias
    cd ../
  else 
    echo "Error: Please run `conda env create -f requirements-conda.yml` first."
    exit
  fi;
fi;