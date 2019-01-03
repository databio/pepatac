#!/usr/bin/env python

__author__ = "Nathan C. Sheffield"
__credits__ = []
__license__ = "BSD2"
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


from pararead import add_logging_options, ParaReadProcessor
from pararead import logger_via_cli


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
        limit, verbosity, shift_factor={"+":4, "-":-5}, summary_filename=None, 
        bedout=False, smoothbw=False, smooth_length=25, step_size=5, retain_temp=False):
        # The resultAcronym should be set for each class
        self.resultAcronym="cuttrace"
        self.chrom_sizes_file = chrom_sizes_file
        self.shift_factor = shift_factor

        # Saving a smooth bigwig doubles the processor use for each chrom, so we
        # need to run half as many chroms at a time
        if smoothbw:
            _LOGGER.info("Cutting parallel chroms in half to accommodate smooth track.")
            nProc = max(int(nProc / 2), 1)

        super(CutTracer,self).__init__(reads_filename, nProc, out_filename, 
            self.resultAcronym, temp_parent, limit, allow_unaligned=False,
            retain_temp=retain_temp)
        self.summary_filename = summary_filename
        self.verbosity=verbosity
        self.bedout = bedout
        self.smoothbw = smoothbw
        self.smooth_length = smooth_length
        self.step_size = step_size

        # Confirm that all the commands we will need are callable

        try:
            self.check_command("wigToBigWig")
            self.check_command("perl")
        except AttributeError:
            # backwards compatibility with earlier versions of pararead that did
            # not have a check_command function
            pass

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
        """

        chrom_size = self.get_chrom_size(chrom)

        #self.unbuffered_write("[Name: " + chrom + "; Size: " + str(chrom_size) + "]")
        _LOGGER.info("[Name: " + chrom + "; Size: " + str(chrom_size) + "]")
        reads = self.fetch_chunk(chrom)

        # if isinstance(reads, list):
        #     print("Chrom has no reads: " + chrom)
        #     return None


        chromOutFile = self._tempf(chrom)
        chromOutFileBw = chromOutFile + ".bw"
        
        cutsToWig = os.path.join(os.path.dirname(__file__), "cutsToWig.pl")
       

        cmd = "sort -n | perl " + cutsToWig + " " + str(chrom_size) 

        # cmd = "awk 'FNR==1 {print;next} { for (i = $1-" + str(self.smooth_length) + \
        #     "; i <= $1+" + str(self.smooth_length) + "; ++i) print i }' | sort -n | perl " + \
        #     cutsToWig + " " + str(chrom_size) 
        cmd2 = "wigToBigWig -clip -fixedSummaries -keepAllChromosomes stdin " + self.chrom_sizes_file + " " + chromOutFileBw
        _LOGGER.debug("  cutsToWigProcess: " + cmd)
        _LOGGER.debug("  wigToBigWigProcess: " + cmd2)
        cutsToWigProcess = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        wigToBigWigProcess = subprocess.Popen(['wigToBigWig', '-clip', '-fixedSummaries', '-keepAllChromosomes', 
                                                'stdin', self.chrom_sizes_file, chromOutFileBw],
                                                stdin=cutsToWigProcess.stdout)


        if self.smoothbw:
            cutsToWigSm = os.path.join(os.path.dirname(__file__), "smoothWig.pl")
            chromOutFileBwSm = chromOutFile + "_smooth.bw"
            tmpFile = chromOutFile + "_cuts.txt"
            cmd = "sort -n | tee " + tmpFile + " | perl " + cutsToWigSm + " " + str(chrom_size) + " " +  str(self.smooth_length) + " " + str(self.step_size)
            cmd2 = "wigToBigWig -clip -fixedSummaries -keepAllChromosomes stdin " + self.chrom_sizes_file + " " + chromOutFileBwSm
            cutsToWigProcessSm = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
            wigToBigWigProcessSm = subprocess.Popen(['wigToBigWig', '-clip', '-fixedSummaries', '-keepAllChromosomes', 
                                                    'stdin', self.chrom_sizes_file, chromOutFileBwSm],
                                                    stdin=cutsToWigProcessSm.stdout)


        if self.bedout:
            chromOutFileBed = chromOutFile + ".bed"
            bedOut = open(chromOutFileBed, "w")
        

        def get_shifted_pos(read, shift_factor):
            """
            Shifts a read according to a shift factor to account for either
            transposition insertion site shifting or DNAse read shifting,
            depending on the strand of the read. Returns the shifted position of
            interest.
            :param read: A pysam read object
            :param shift_factor: A dict with positive or negative integer values
                for keys ["+", "-"], indicating how much (and which direction)
                to shift reads on the + or - strand
            """
            # default
            shifted_pos = None
            if read.flag & 1:  # paired
                if read.flag == 99:  # paired, mapped in pair, mate reversed, first in pair
                    shifted_pos = read.reference_start + shift_factor["+"]
                    #r.reference_length  # col 8
                elif read.flag == 147:  # mate of 99
                    shifted_pos = read.reference_end + shift_factor["-"]
                elif read.flag == 163:  # paired, mapped in pair, mate reversed, second in pair
                    shifted_pos = read.reference_start + shift_factor["+"]
                elif read.flag == 83:   # mate of 163
                    shifted_pos = read.reference_end + shift_factor["-"]
            else:  # unpaired
                if read.flag & 16:  # read reverse strand
                    shifted_pos = read.reference_end + shift_factor["-"]
                else:
                    shifted_pos = read.reference_start + shift_factor["+"]

            return shifted_pos    


        begin = 1
        header_line = "fixedStep chrom=" + chrom + " start=" + str(begin) + " step=1\n";
        cutsToWigProcess.stdin.write(header_line)

        if self.smoothbw:
            header_line = "fixedStep chrom=" + chrom + " start=" + str(begin) + " step=" + str(self.step_size) + "\n";
            cutsToWigProcessSm.stdin.write(header_line)

        try:
            for read in reads:
                shifted_pos = get_shifted_pos(read, shift_factor)
                cutsToWigProcess.stdin.write(str(shifted_pos) + "\n")

                if self.smoothbw:
                    cutsToWigProcessSm.stdin.write(str(shifted_pos) + "\n")

                if self.bedout:
                    strand = "-" if read.is_reverse else "+"
                    # The bed file needs 6 columns (even though some are dummy) because
                    # MACS says so.
                    bedOut.write("\t".join([
                        chrom,
                        str(shifted_pos - self.smooth_length),
                        str(shifted_pos + self.smooth_length), 
                        "N", 
                        "0",
                        strand]) + "\n")
            

            # Clean up processes

            cutsToWigProcess.stdin.close()

            if self.bedout:
                bedOut.close()

            if self.smoothbw:
                cutsToWigProcessSm.stdin.close()
                _LOGGER.debug("Encoding smooth bigwig for " + chrom + " (last read position:" + str(read.pos) + ")...")
                wigToBigWigProcessSm.communicate()

            # For chroms with no reads, the 'read' variable will not be bound.
            #if read in locals():

            _LOGGER.debug("Encoding bigwig for " + chrom + " (last read position:" + str(read.pos) + ")...")
            wigToBigWigProcess.communicate()

        except StopIteration as e:
            print("StopIteration error for chrom ", chrom, ": ", e)
            raise e

        return chrom

    def combine(self, good_chromosomes):
        """
        After running the process in parallel, this 'reduce' step will simply
        merge all the temporary files into one, and rename it to the output
        file name.
        """
        if not good_chromosomes:
            _LOGGER.info("No successful chromosomes, so no combining.")
            return
        elif len(good_chromosomes) == 1:
            subprocess.call(["mv", self._tempf(good_chromosomes[0]) + ".bw", self.outfile])
            subprocess.call(["mv", self._tempf(good_chromosomes[0]) + "_smooth.bw", self.smoothbw])

        else:
            _LOGGER.info("Merging {} files into output file: '{}'".
                  format(len(good_chromosomes), self.outfile))
            temp_files = [self._tempf(chrom) + ".bw" for chrom in good_chromosomes]
            cmd = "bigWigCat " + self.outfile + " " + " ".join(temp_files)
            _LOGGER.debug(cmd)
            p = subprocess.call(['bigWigCat', self.outfile] + temp_files)


            if self.smoothbw:
                _LOGGER.info("Merging {} files into output file: '{}'".
                      format(len(good_chromosomes), self.smoothbw))
                temp_files = [self._tempf(chrom) + "_smooth.bw" for chrom in good_chromosomes]
                cmd = "bigWigCat " + self.smoothbw + " " + " ".join(temp_files)
                _LOGGER.debug(cmd)
                p = subprocess.call(['bigWigCat', self.smoothbw] + temp_files)

            if self.bedout:
                # root, ext = os.path.splitext(self.outfile)
                temp_files = [self._tempf(chrom) + ".bed" for chrom in good_chromosomes]
                cmd = "cat " + " ".join(temp_files) + " > " + self.bedout
                _LOGGER.debug(cmd)
                p = subprocess.call(cmd, shell=True)



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
        help="Output file (bigwig format)")
    parser.add_argument('-w', '--smoothbw', dest='smoothbw', default=None,
        help="Output filename for smooth bigwig. Default: None")
    parser.add_argument('-r', '--step-size', default=5,
        help="Step size for smooth tracks. Default: 5")
    parser.add_argument('-b', '--bedout', default=None,
        help="Output filename for bed file. Default: None")
    parser.add_argument('-l', '--smooth-length',
        help="Smooth length for bed file", default=25, type=int)
    parser.add_argument('-e', '--temp-parent',
        default="",#os.getcwd(),
        help="Temporary file location. By default it will use the working directory,"
        " but you can place this elsewhere if you'd like."
        " The actual folder will be based on the outFile.")
    parser.add_argument("--dnase", action="store_true",
        help="Turn on DNase mode (this adjusts the shift parameters)")
    parser.add_argument('-m', '--limit', dest='limit',
        help="Limit to these chromosomes", nargs = "+", default=None)
    parser.add_argument('-p', '--cores', dest='cores',
        help="Number of cores to use", default=2, type=int)
    parser.add_argument('--retain-temp', action='store_true', default=False,
        help="Retain temporary files? Default: False")

    parser = add_logging_options(parser)
    return parser.parse_args(cmdl)


if __name__ == "__main__":

    args = parse_args(sys.argv[1:])
    _LOGGER = logger_via_cli(args)


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
                    summary_filename=args.summary_file,
                    bedout=args.bedout,
                    smoothbw=args.smoothbw,
                    smooth_length=args.smooth_length,
                    step_size=args.step_size,
                    retain_temp=args.retain_temp)

    ct.register_files()
    good_chromosomes = ct.run()
    
    _LOGGER.info("Reduce step (merge files)...")
    ct.combine(good_chromosomes)



# Some code that implements a buffered version; didn't turn out to be any faster
                # # Only do the bigwig output
                # read = reads.next()
                # shifted_pos = get_shifted_pos(read, shift_factor)
                # buffered_pos = shifted_pos

                # for read in reads:
                #     shifted_pos = get_shifted_pos(read, shift_factor)
                #     buff.append(shifted_pos)

                #     while buffered_pos < shifted_pos - 100:
                #         cutsToWigProcess.stdin.write(str(buffered_pos) + "\n")
                #         if self.smoothbw:
                #             cutsToWigProcessSm.stdin.write(str(buffered_pos) + "\n")
                #         buffered_pos = buff.popleft()