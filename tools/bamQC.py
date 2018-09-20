#!/usr/bin/env python
# bamQC.py
#
# Last updated 8/4/18: Jason Smith
#
# Function: Script takes as input a BAM file and calculates the non-redundant
#           fraction (NRF) and the PCR bottleneck coefficients 1 (PBC1)
#           and 2 (PBC2). 
#

from argparse import ArgumentParser
import os
import sys

import pararead
#from pararead.processor import _LOGGER
from pararead import add_logging_options, ParaReadProcessor
from pararead import logger_via_cli

import pandas as _pd
import numpy as np

class bamQC(pararead.ParaReadProcessor):
    def __init__(self, reads_filename, n_proc, out_filename, verbosity):
        """
        Derive from ParaReadProcessor to build the bamQC caller instance.

        Parameters
        ----------
        reads_filename : str
            Path to BAM file with aligned sequencing reads.
        n_proc : int, default 20
            Number of cores to use for processing.
        out_filename : str
            Name of output bamQC file
        """
        super(bamQC, self).__init__(reads_filename, n_proc, out_filename)
        self.reads_filename = reads_filename
        self.verbosity = verbosity

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
            dups, unmap, unmap_mate, prop_pair, \
                qcfail, num_pairs, num_reads = (0, 0, 0, 0, 0, 0, 0)
            for read in chr:
                num_reads += 1
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
            return {'num_reads':num_reads, 'num_pairs':num_pairs/2,
                    'dups':dups, 'unmap':unmap, 'unmap_mate':unmap_mate,
                    'prop_pair':prop_pair, 'qcfail':qcfail}

        def getRead(chr, paired):
            if not paired:
                keyDict = {'query_name', 'query_pos', 'template_length'}
                readDict = dict([(key, []) for key in keyDict])
                for read in chr:
                    readDict['query_name'].append(read.query_name)
                    readDict['query_pos'].append(read.pos)
                    readDict['template_length'].append(read.query_length)
                return _pd.DataFrame(readDict)
            else:
                keyDict = {'query_name', 'query_pos', 'template_length'}
                read1 = dict([(key, []) for key in keyDict])
                read2 = dict([(key, []) for key in keyDict])
                for read in chr:
                    if read.is_paired:
                        if read.is_read1:
                            read1['query_name'].append(read.query_name)
                            read1['query_pos'].append(read.pos)
                            read1['template_length'].append(read.template_length)
                        elif read.is_read2:
                            read2['query_name'].append(read.query_name)
                            read2['query_pos'].append(read.pos)
                            read2['template_length'].append(read.template_length)
                merge = _pd.merge(_pd.DataFrame(read1), _pd.DataFrame(read2),
                                  on = 'query_name')
                return merge 

        ##### MAIN #####
        _LOGGER.info("[Name: " + chrom + "; Size: " + str(chrom_size) + "]")
        if os.path.isfile(self.reads_filename):
            chrom_out_file = self._tempf(chrom)
            readCount = []
            chrStats = {}
            mitoCount = 0
            isPE = isPaired(self.fetch_chunk(chrom))   
            flags = countFlags(self.fetch_chunk(chrom))
            if ('chrM' or 'rCRSd') in chrom:
                mitoCount = mitoCount + float(flags['num_pairs'])
                chrStats = {'mitoReads':mitoCount}         
                #chrStats.update(flags)
                np.save(chrom_out_file, chrStats)
                return chrom
            if isPE:
                readVals = getRead(self.fetch_chunk(chrom), isPE)
                readVals = readVals.drop(columns='query_name')            
                M_DISTINCT = len(readVals.drop_duplicates())
                M1 = ((flags['num_pairs']) -
                       len(readVals[readVals.duplicated(keep=False)]))
                posDup = readVals[readVals.duplicated(keep=False)]
                posDupTable = posDup.groupby(['query_pos_x','template_length_x']).count()
                cTable = posDupTable.groupby(['query_pos_y']).count()
                M2 = 0
                for key, value in cTable['template_length_y'].items():
                    if key == 2:
                        M2 = value
                chrStats = {'M_DISTINCT':M_DISTINCT, 'M1':M1, 'M2':M2}         
                chrStats.update(flags)
                np.save(chrom_out_file, chrStats)
            else:
                readSE = getRead(self.fetch_chunk(chrom), isPE)
                readSE = readSE.drop(columns='query_name')
                M_DISTINCT = len(readSE.drop_duplicates())
                M1 = (flags['num_reads']) - len(readSE[readSE.duplicated(keep=False)])
                posDup = readSE[readSE.duplicated(keep=False)]
                cTable = posDup.groupby(['query_pos']).count()
                M2 = 0
                if not cTable.empty:
                    for key,value in cTable['template_length'].items():
                        if value == 2:
                            M2 += 1
                chrStats = {'M_DISTINCT':M_DISTINCT, 'M1':M1, 'M2':M2}         
                chrStats.update(flags)
                np.save(chrom_out_file, chrStats)
            return chrom
        else:
            _LOGGER.warn("{} could not be found.".format(self.reads_filename))
            return

    def combine(self, good_chromosomes, strict=False):
        """
        After running the process in parallel, this 'reduce' step will merge
        all the temporary files into one, calculate the NRF, PBC1, and PBC2
        and write those values to the outfile.
        """
        if not good_chromosomes:
            _LOGGER.warn("No successful chromosomes, so no combining.")
            header = ["Total_read_pairs", "Distinct_read_pairs",
                      "One_read_pair", "Two_read_pairs", "Duplicate_rate",
                      "Mitochondria_reads", "Mitochondria_rate", "NRF",
                      "PBC1", "PBC2"]
            np.savetxt(self.outfile, np.c_[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       header='\t'.join(header), fmt='%s', delimiter='\t',
                       comments='')
            return
        else:
            _LOGGER.info("Merging {} files into output file: '{}'".
                         format(len(good_chromosomes), self.outfile))
            temp_files = [self._tempf(chrom) for chrom in good_chromosomes]
            stats = {}
            for i in range(len(temp_files)):
                if not os.path.exists(temp_files[i] + '.npy'):
                    continue
                # load chrom data and add to dict                
                chrStats = np.load(temp_files[i] + '.npy')
                stats = {k: stats.get(k, 0) + chrStats.item().get(k, 0) for k in set(stats) | set(chrStats.item())}
            if stats['num_pairs'] == 0:
                total = max(1, float(stats['num_reads'])) 
            else:
                total = max(1, float(stats['num_pairs'])) 
            dupRate = float(stats['dups'])/total
            NRF = float(stats['M1'])/total
            M2 = max(1, float(stats['M2']))
            PBC1 = float(stats['M1'])/max(1, float(stats['M_DISTINCT']))
            PBC2 = float(stats['M1'])/float(M2)
            try:
                mitoReads = float(stats['mitoReads'])
            except KeyError:
                mitoReads = 0	
            try:
                mitoRate = float(stats['mitoReads'])/total
            except KeyError:
                mitoRate = 0
            header = ["Total_read_pairs", "Distinct_read_pairs",
                      "One_read_pair", "Two_read_pairs", "Duplicate_rate",
                      "Mitochondria_reads", "Mitochondria_rate", "NRF",
                      "PBC1", "PBC2"]
            np.savetxt(self.outfile, np.c_[total, stats['M_DISTINCT'],
                       stats['M1'], M2, dupRate, mitoReads,
                       mitoRate, NRF, PBC1, PBC2],
                       header='\t'.join(header), fmt='%s', delimiter='\t',
                       comments='')


# read options from command line
def parse_args(cmdl):
    parser = ArgumentParser(description='--Produce bamQC File--')
    parser.add_argument('-i', '--infile', dest='infile',
                        help="Path to input file (in BAM format).",
                        required=True)
    parser.add_argument('-o', '--outfile', dest='outfile',
                        help="Output file name.")
    parser.add_argument('-c', '--cores', dest='cores', default=20, type=int,
                        help="Number of processors to use. Default=20")

    parser = add_logging_options(parser)
    return parser.parse_args(cmdl)


# parallel processed computation of matrix for each chromosome
if __name__ == "__main__":

    args = parse_args(sys.argv[1:])
    _LOGGER = logger_via_cli(args)

    qc = bamQC(reads_filename=args.infile,
               out_filename=args.outfile,
               n_proc=args.cores,
               verbosity=args.verbosity)

    qc.register_files()
    good_chromosomes = qc.run()

    _LOGGER.info("Reduce step (merge files)...")
    qc.combine(good_chromosomes)
