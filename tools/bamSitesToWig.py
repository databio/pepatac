#!/usr/bin/env python

__author__ = "Nathan C. Sheffield"
__credits__ = []
__license__ = "GPL3"
__version__ = "0.1"
__email__ = "nathan@code.databio.org"

import pysam
import ParaRead
import pandas
import sys
import os
from operator import methodcaller
import numpy
import itertools # Used for nested region looping across reads
from argparse import ArgumentParser

parser = ArgumentParser(description='Bam processor')
parser.add_argument('-i', '--infile', dest='infile',
		help="Input file (in bam or sam format)",
		required=True)
parser.add_argument('-o', '--outfile', dest='outfile',
		help="Output file")
parser.add_argument('-s', '--summary-file', dest='summary_file',
		help="Summary output file (optional)")
parser.add_argument('-e', '--tempParent', dest='temp_parent',
		help="Temporary file location. By default it will use the working directory, but you can place this elsewhere if you'd like. The actual folder will be based on the outFile.", default="")
parser.add_argument('-m', '--limit', dest='limit',
		help="Limit to these chromosomes", nargs = "+", default=None)
parser.add_argument('-c', '--cores', dest='cores',
		help="Number of cores to use", default=4, type=int)

parser.add_argument('-v', '--verbosity', dest='verbosity', default=1,
 		help="Set verbosity level. 0 for silent; 1 for warnings; 2 for details",
		type=int)

args = parser.parse_args()

# A function object like this will be pickled by the parallel call to map,
# So it cannot contain huge files or the pickling will limit everything.
# For this reason I must rely on global vars for the big stuff.
class CutTracer(ParaRead.ParaReadProcessor):
	"""
	A function object that holds parameters and can be called
	on different chromosomes. This extends the ParaReadProcessor object so
	that it can be run in parallel.
	"""
	def __init__(self, bamFileName, tempParent, nProc, outFile,
		limit, verbosity, summary_filename=None):
		# The resultAcronym should be set for each class
		self.resultAcronym="cuttrace"
		super(CutTracer,self).__init__(bamFileName, nProc, outFile, tempParent, limit, allow_unaligned=False)
		self.summary_filename = summary_filename
		self.verbosity=verbosity

	def registerFiles(self):
		super(CutTracer, self).registerFiles()

	def __call__(self, chrom):
		"""
		Workhorse function of the method.
		This function takes a chrom, and processes the reads in that chromosome
		in the input bamfile
		@param chrom: a string with a chromosome, used by bamFile.fetch to
		grab a subset of reads from the bamfile
		@param bamFile: a pysam.AlignmentFile object of the bam file to read
		@param tempFolder: temporary output folder.
		"""
		self.unbufferedWrite(chrom + ", ")

		try:
			bamFile = ParaRead.paraReadFiles['bamFile']
			# Read in all reads on this chromosome
			bamFileReads = bamFile.fetch(chrom, multiple_iterators=True)
		except IOError:
			print("Error reading bamFile for ", chrom)

		verbosity = self.verbosity

		if verbosity > 1: print(chrom)
		#cgIter = iter(range(pos_count))
		cut_counts = numpy.arange(1, chrom_size)
		baseIter = iter(cut_counts) 
		try:
			for read in bamFileReads:
				count_read = count_read + 1
				
				cut_counts[read.pos] += 1
				cut_counts[read.aend] += 1

			# Processing is finished; iteration is complete. We reset the iterator and
			# Print results to file.
			chromOutFile = os.path.join(tempFolder, chrom + ".txt")
			chromOutFileBw = os.path.join(tempFolder, chrom + ".bw")
			if verbosity > 1: print ("Writing " + chrom + " to " + chromOutFile)


			wigToBigWigProcess = subprocess.Popen(['wigToBigWig', '-clip', '--fixedStep', '--keepAllChromosomes', 'stdin', chromOutFileBw],
													stdin=subprocess.PIPE)
			
			begin = 1
			header_line = "fixedStep chrom=" + chrom + " start= " + begin + " step=1\n";
			wigToBigWigProcess.stdin.write(header_line)

			# loop through each base to print
			with open(chromOutFile, "w") as record_file:
				for baseIdx in baseIter:
					record_file.write(cut_counts[baseIdx] + '\n')
					wigToBigWigProcess.stdin.write(cut_counts[baseIdx] + '\n')

		except StopIteration as e:
			print("StopIteration error for chrom ", chrom, ": ", e)
			raise e

		return chrom

if __name__ == "__main__":
	# Some sample data for an interactive example run:
	if False:
		bamFileName = "/fhgfs/groups/lab_bock/shared/projects/ews_patients/results_pipeline/T119_wg/bismark_hg19/T119_wg.final.bam"
		methFileName = "/fhgfs/groups/lab_bock/shared/projects/ews_patients/results_pipeline/T119_wg/bismark_hg19/extractor/T119_wg.aln.dedup.filt.bismark.cov"
		methFormat=="bismark"
