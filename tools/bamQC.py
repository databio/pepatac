#!/usr/bin/env python
# bamQC.py
#
# Last updated 7/11/18: Jason Smith
#
# Function: Script takes as input a BAM file and calculates the non-redundant
#           fraction (NRF), and the PCR bottleneck coefficients 1 (PCB1)
#           and 2 (PCB2). 
#

from argparse import ArgumentParser
from operator import methodcaller
import os
import sys

import pararead
from pararead.processor import PARA_READ_FILES, _LOGGER

#import pysam
from itertools import izip as zip
import pandas as _pd
import numpy as np

#### OPTIONS ####
# read options from command line
# usage = "usage: %prog [options] [inputs]"
# opts = OptionParser(usage=usage)
# opts.add_option("-b", help="<Reads> Accepts sorted BAM file")
# opts.add_option("-o",help="OutputFile")
# opts.add_option("-c",default="8",help="number of threads to use, default=8")
# options, arguments = opts.parse_args()

# return usage information if no argvs given
# if len(sys.argv)==1:
    # os.system(sys.argv[0]+" --help")
    # sys.exit()

class bamQC(pararead.ParaReadProcessor):
    def __init__(self, reads_filename, chrom_sizes_file,
                 temp, n_proc, out_filename, limit):
        """
        Derive from ParaReadProcessor to build the bamQC caller instance.

        Parameters
        ----------
        reads_filename : str
            Path to BAM file with aligned sequencing reads.
        chrom_sizes_file : str
            Path to chromosome sizes file.
            FORMAT: ['chromosome','size']
        temp : str, optional
            Where to place temporary processing files.
        n_proc : int, default 20
            Number of cores to use for processing.
        out_filename : str
            Name of output bamQC file
        limit : list of str, optional
            Names of chromosomes of interest; the default
            assumption is that all chromosomes are of interest.
        """
        self.chrom_sizes_file = chrom_sizes_file
        self.reads_filename = reads_filename
        self.qc_file = out_filename
        super(bamQC, self).__init__(reads_filename, n_proc, out_filename,
                                    temp, limit)

    def register_files(self):
        """
        This function will make sure that the files needed for
        processing are stored in the module-level (global-like)
        variables stored in the pararead module, such that each child
        process can extract the assigned subset from the global files.
        """
        super(bamQC, self).register_files()

    def __call__(self, chrom):
        """
        Primary function of the method.
        This function takes a chrom, and processes the reads in that chromosome
        from the input bamfile

        @param chrom: a string with a chromosome, used by pysam.fetch to
        grab a subset of reads from the bamfile
        """

        chrom_size = self.get_chrom_size(chrom)
        
        ##### DEFINE FUNCTIONS #####
        def isPaired(chr):
            for read in chr:
                if read.is_paired:
                    return True
            return False

        def countFlags(chr):
            dups = 0
            unmap = 0
            unmap_mate = 0
            prop_pair = 0
            qcfail = 0
            num_pairs = 0
            for read in chr:
                if read.is_paired:
                    num_pairs += 1
                if read.is_duplicate:
                    dups += 1
                if read.is_unmapped:
                    unmap += 1
                if read.mate_is_unmapped:
                    unmap_mate += 1
                if read.is_proper_pair:
                    prop_pair += 1
                if read.is_qcfail:
                    qcfail += 1   
            return {'num_pairs':num_pairs/2, 'dups':dups, 'unmap':unmap,
                    'unmap_mate':unmap_mate, 'prop_pair':prop_pair,
                    'qcfail':qcfail}

        # def getRead1(chr):
            # read1 = _pd.DataFrame(columns=['query_name','query_pos','template_length'])
            # for read in chr:
                # if read.is_paired:
                    # if read.is_read1:
                        # read1 = read1.append({'query_name':read.query_name,'query_pos':read.pos,'template_length':read.template_length}, ignore_index=True)
            # return read1
            
        def getRead1(chr):
            keyDict = {'query_name', 'query_pos', 'template_length'}
            read1 = dict([(key, []) for key in keyDict])
            for read in chr:
                if read.is_paired:
                    if read.is_read1:
                        read1['query_name'].append(read.query_name)
                        read1['query_pos'].append(read.pos)
                        read1['template_length'].append(read.template_length)
            return _pd.DataFrame(read1)
        
        # def getRead2(chr):
            # read2 = _pd.DataFrame(columns=['query_name','query_pos','template_length'])
            # for read in chr:
                # if read.is_paired:
                    # if read.is_read2:
                        # read2 = read2.append({'query_name':read.query_name,'query_pos':read.pos,'template_length':read.template_length}, ignore_index=True)
            # return read2
        
        def getRead2(chr):
            keyDict = {'query_name', 'query_pos', 'template_length'}
            read2 = dict([(key, []) for key in keyDict])
            for read in chr:
                if read.is_paired:
                    if read.is_read2:
                        read2['query_name'].append(read.query_name)
                        read2['query_pos'].append(read.pos)
                        read2['template_length'].append(read.template_length)
            return _pd.DataFrame(read2)
        
        # def checkReads(chr):
            # read1 = _pd.DataFrame(columns=['query_name','query_pos','template_length'])
            # read2 = _pd.DataFrame(columns=['query_name','query_pos','template_length'])
            # numPairs = 0
            # for read in chr:
                # if read.is_paired:
                    # numPairs += 1
                    # if read.is_read1:
                        # read1 = read1.append({'query_name':read.query_name,'query_pos':read.pos,'template_length':read.template_length}, ignore_index=True)
                    # elif read.is_read2:
                        # read2 = read2.append({'query_name':read.query_name,'query_pos':read.pos,'template_length':read.template_length}, ignore_index=True)
            # merge = _pd.merge(read1, read2, on = 'query_name')
            # merge = merge.drop(columns='query_name')            
            # M_DISTINCT = len(merge.drop_duplicates())
            # M1 = (numPairs/2) - len(merge[merge.duplicated(keep=False)])
            # posDup = merge[merge.duplicated(keep=False)]
            # posDupTable = posDup.groupby(['query_pos_x','template_length_x']).count()
            # cTable = posDupTable.groupby(['query_pos_y']).count()
            # M2 = 0
            # for key, value in cTable['template_length_y'].items():
                # if key == 2:
                    # M2 = value
            # return {'M_DISTINCT':M_DISTINCT, 'M1':M1, 'M2':M2, 'numPairs':(numPairs/2)}

        ##### MAIN #####
        _LOGGER.info("[Name: " + chrom + "; Size: " + str(chrom_size) + "]")
        if os.path.isfile(self.reads_filename):
            #reads = self.fetch_chunk(chrom)
            chrom_out_file = self._tempf(chrom)
            readCount = []
            chrStats = {}
            mitoCount = 0
            isPE = isPaired(self.fetch_chunk(chrom))   
            flags = countFlags(self.fetch_chunk(chrom))
            if isPE:
                read1 = getRead1(self.fetch_chunk(chrom))
                read2 = getRead2(self.fetch_chunk(chrom))
            merge = _pd.merge(read1, read2, on = 'query_name')
            merge = merge.drop(columns='query_name')
            if chrom == 'chrM':
                mitoCount = mitoCount + float(flags['num_pairs'])
            M_DISTINCT = len(merge.drop_duplicates())
            M1 = (flags['num_pairs']) - len(merge[merge.duplicated(keep=False)])
            posDup = merge[merge.duplicated(keep=False)]
            posDupTable = posDup.groupby(['query_pos_x','template_length_x']).count()
            cTable = posDupTable.groupby(['query_pos_y']).count()
            M2 = 0
            for key, value in cTable['template_length_y'].items():
                if key == 2:
                    M2 = value
            chrStats = {'M_DISTINCT':M_DISTINCT, 'M1':M1, 'M2':M2}         
            chrStats.update(flags)
            np.save(chrom_out_file, chrStats)
            return chrom
        else:
            _LOGGER.warn("{} could not be found.".format(self.reads_filename))
            return

    def combine(self, good_chromosomes, strict=False):
        """
        After running the process in parallel, this 'reduce' step will simply
        merge all the temporary files into one, and rename it to the output
        file name.
        """
        if not good_chromosomes:
            _LOGGER.warn("No successful chromosomes, so no combining.")
            return
        else:
            _LOGGER.info("Merging {} files into output file: '{}'".
                         format(len(good_chromosomes), self.outfile))
            temp_files = [self._tempf(chrom) for chrom in good_chromosomes]
            stats = {}
            for i in range(len(temp_files)):
                #_LOGGER.info("temp file:" + temp_files[i])
                if not os.path.exists(temp_files[i] + '.npy'):
                    continue
                # load chrom data and add to dict                
                chrStats = np.load(temp_files[i] + '.npy')
                #_LOGGER.info(chrStats)
                stats = {k: stats.get(k, 0) + chrStats.item().get(k, 0) for k in set(stats) | set(chrStats.item())}
                #_LOGGER.info(stats)
            total = max(1, float(stats['num_pairs'])) 
            dupRate = stats['dups']/total
            NRF = float(stats['M1'])/total
            M2 = max(1, float(stats['M2']))
            PBC1 = float(stats['M1'])/max(1, float(stats['M_DISTINCT']))
            PBC2 = float(stats['M1'])/float(M2)
            np.savetxt(self.outfile, np.c_[dupRate, NRF, PBC1, PBC2],
                       header="Duplicate_rate, NRF, PBC1, PBC2", fmt='%s',
                       delimiter=',')

# read options from command line
def parse_args(cmdl):
    parser = ArgumentParser(description='--Produce bamQC File--')
    parser.add_argument('-i', '--infile', dest='infile',
                        help="Path to input file (in BAM format).",
                        required=True)
    parser.add_argument('-z', '--chrom-sizes-file', dest='chrom_sizes_file',
                        help="Path to chromosome sizes file.",
                        required=True)
    parser.add_argument('-o', '--outfile', dest='outfile',
                        help="Output file name.")
    # TODO: Still need to integrate this as an argument and get it working
    parser.add_argument('-t', '--temp', default="",  # os.getcwd(),
                        help="Temporary file location. Default: current"
                        " working directory."
                        " However, you can place this elsewhere if you'd like."
                        " The actual folder will be based on the outFile.")
    parser.add_argument('-c', '--cores', dest='cores', default=20, type=int,
                        help="Number of processors to use. Default=20")
    # TODO: not working at moment, makes sense to just eliminate most likely
    parser.add_argument('-m', '--limit', dest='limit',
                        help="Limit to listed chromosome(s).", nargs="+",
                        default=None)
    return parser.parse_args(cmdl)
            
# parallel processed computation of matrix for each chromosome
if __name__ == "__main__":
    args = parse_args(sys.argv[1:])

    qc = bamQC(reads_filename=args.infile,
               chrom_sizes_file=args.chrom_sizes_file,
               temp=args.temp,
               n_proc=args.cores,
               out_filename=args.outfile,
               limit=args.limit)

    qc.register_files()
    good_chromosomes = qc.run()

    print("Reduce step (merge files)...")
    qc.combine(good_chromosomes)
