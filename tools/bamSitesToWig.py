#!/usr/bin/env python

__author__ = "Nathan C. Sheffield"
__credits__ = []
__license__ = "GPL3"
__version__ = "0.1"
__email__ = "nathan@code.databio.org"

from argparse import ArgumentParser
import itertools # Used for nested region looping across reads
import numpy
from operator import methodcaller
import os
import subprocess
import sys

import pararead
import pysam

# A function object like this will be pickled by the parallel call to map,
# So it cannot contain huge files or the pickling will limit everything.
# For this reason I must rely on global vars for the big stuff.
class CutTracer(pararead.ParaReadProcessor):
    """
    A function object that holds parameters and can be called
    on different chromosomes. This extends the ParaReadProcessor object so
    that it can be run in parallel.
    """
    def __init__(self, reads_filename, chrom_sizes_file, temp_parent, nProc, out_filename,
        limit, verbosity, shift_factor={"+":4, "-":-5}, summary_filename=None):
        # The resultAcronym should be set for each class
        self.resultAcronym="cuttrace"
        self.chrom_sizes_file = chrom_sizes_file
        self.shift_factor = shift_factor
        super(CutTracer,self).__init__(reads_filename, nProc, out_filename, self.resultAcronym, temp_parent, limit, allow_unaligned=False)
        self.summary_filename = summary_filename
        self.verbosity=verbosity

    def register_files(self):
        super(CutTracer, self).register_files()

    def unbuffered_write(self, txt):
        """ Writes unbuffered output by flushing after each stdout.write call """
        sys.stdout.write(txt)
        sys.stdout.flush()

    def __call__(self, chrom):
        """
        Workhorse function of the method.
        This function takes a chrom, and processes the reads in that chromosome
        in the input bamfile
        @param chrom: a string with a chromosome, used by bamFile.fetch to
        grab a subset of reads from the bamfile
        @param bamFile: a pysam.AlignmentFile object of the bam file to read
        @param temp_folder: temporary output folder.
        """
        try:
            reads_file = pararead.PARA_READ_FILES[pararead.READS_FILE_KEY]
            # Read in all reads on this chromosome
            reads = reads_file.fetch(chrom, multiple_iterators=True)
        except IOError:
            print("Error reading reads_file for ", chrom)


        reads = self.get_reads(identifier)

        if not any(reads):
            print("Chrom has no reads: " + chrom)
            return None

        chrom_size = -1
        for x in reads_file.header['SQ']:
            if x['SN'] == chrom:
                chrom_size = x['LN']
                self.unbuffered_write("[Name: " + x['SN'] + "; Size: " + str(chrom_size) + "]")

        chromOutFile = self._tempf(chrom)
        chromOutFileBw = chromOutFile + ".bw"
        
        cutsToWig = os.path.join(os.path.dirname(__file__), "cutsToWig.pl")

        cmd = "sort -n | perl " + cutsToWig + " " + str(chrom_size) 
        cmd2 = "wigToBigWig -clip -fixedSummaries -keepAllChromosomes stdin " + self.chrom_sizes_file + " " + chromOutFileBw
        cutsToWigProcess = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        wigToBigWigProcess = subprocess.Popen(['wigToBigWig', '-clip', '-fixedSummaries', '-keepAllChromosomes', 
                                                'stdin', self.chrom_sizes_file, chromOutFileBw],
                                                stdin=cutsToWigProcess.stdout)

        begin = 1
        header_line = "fixedStep chrom=" + chrom + " start=" + str(begin) + " step=1\n";
        cutsToWigProcess.stdin.write(header_line)
        try:
            for read in reads:
                if read.flag == 99: # paired, mapped in pair, mate reversed, first in pair
                    cutsToWigProcess.stdin.write(str(read.reference_start + self.shift_factor["+"]) +"\n")
                    #r.reference_length  # col 8
                elif read.flag == 147: # mate of 99
                    cutsToWigProcess.stdin.write(str(read.reference_end + self.shift_factor["-"]) +"\n")
                elif read.flag == 163: # paired, mapped in pair, mate reversed, second in pair
                    cutsToWigProcess.stdin.write(str(read.reference_start + self.shift_factor["+"]) +"\n")
                elif read.flag == 83:  # mate of 83
                    cutsToWigProcess.stdin.write(str(read.reference_end + self.shift_factor["-"]) +"\n")

            cutsToWigProcess.stdin.close()
            print("Encoding bigwig for " + chrom + " (last read position:" + str(read.pos) + ")...")
            wigToBigWigProcess.communicate()

        except StopIteration as e:
            print("StopIteration error for chrom ", chrom, ": ", e)
            raise e

        return chrom


    def write_cuts(self, cutsToWigProcess, cut):
        cutsToWigProcess.stdin.write(str(read.reference_start + self.shift_factor["+"]) +"\n")

    def combine(self, good_chromosomes):
        """
        After running the process in parallel, this 'reduce' step will simply
        merge all the temporary files into one, and rename it to the output
        file name.
        """
        if not good_chromosomes:
            print("No successful chromosomes, so no combining.")
            return
        elif len(good_chromosomes) == 1:
            subprocess.call(["mv", self._tempf(good_chromosomes[0]) + ".bw", self.outfile])

        else:
            print("Merging {} files into output file: '{}'".
                  format(len(good_chromosomes), self.outfile))
            temp_files = [self._tempf(chrom) + ".bw" for chrom in good_chromosomes]
            cmd = "bigWigCat " + self.outfile + " " + " ".join(temp_files)
            print(cmd)
            p = subprocess.call(['bigWigCat', self.outfile] + temp_files)


def parse_args(cmdl):
    parser = ArgumentParser(description='Bam processor')
    parser.add_argument('-i', '--infile', dest='infile',
        help="Input file (in bam or sam format)",
        required=True)
    parser.add_argument('-c', '--chrom-sizes-file',
        help="Chromosome sizes file",
        required=True)
    parser.add_argument('-s', '--summary-file',
        help="Summary file")
    parser.add_argument('-o', '--outfile', dest='outfile',
        help="Output file")
    parser.add_argument('-e', '--temp-parent',
        default="",#os.getcwd(),
        help="Temporary file location. By default it will use the working directory,"
        " but you can place this elsewhere if you'd like."
        " The actual folder will be based on the outFile.")
    parser.add_argument("--dnase", action="store_true",
        help="Turn on DNase mode")
    parser.add_argument('-m', '--limit', dest='limit',
        help="Limit to these chromosomes", nargs = "+", default=None)
    parser.add_argument('-p', '--cores', dest='cores',
        help="Number of cores to use", default=2, type=int)
    parser.add_argument('-v', '--verbosity', dest='verbosity', default=1,
        help="Set verbosity level. 0 for silent; 1 for warnings; 2 for details",
        type=int)
    parser.add_argument("--loglevel", default="INFO",
                        help="Level at which to listen for logging messages")

    return parser.parse_args(cmdl)


if __name__ == "__main__":

    args = parse_args(sys.argv[1:])

    if args.dnase:
        shift_factor = {"+":1, "-":0}  # DNase
    else:
        shift_factor = {"+":4, "-":-5}  # ATAC

    ct = CutTracer( reads_filename=args.infile,
                    chrom_sizes_file=args.chrom_sizes_file,
                    temp_parent=args.temp_parent,
                    nProc=args.cores,
                    out_filename=args.outfile,
                    limit=args.limit,
                    verbosity=args.verbosity,
                    shift_factor=shift_factor,
                    summary_filename=args.summary_file)

    ct.register_files()
    good_chromosomes = ct.run()
    
    print("Reduce step...")
    ct.combine(good_chromosomes)
