#!/usr/bin/env python
# pyTssEnrichment.py
#
# Modified from pyMakeVplot.py: Jason Buenrostro
# Last updated 7/16/17: Vince Reuter
#
# Dependencies: Script requires ATAC_Rscript_TSSenrichmentPlot_pyPiper.R to be in the same directory
#				For pyPiper, these two scripts would be in the tools directory
#
# Function: Script takes as input a BAM file and a bed file of single base positions and plots the enrichment of signal around those regions
#			This enrichment is calculated as the cumulative insertions per base divided by the average number of insertions in the first 100 bases of the window
#
# Parameters: This version of the script expects a certain set or parameters in order to properly interface with ATAC_Rscript_TSSenrichmentPlot_pyPiper.R
#			  Those parameters are: -p ends -e 2000 -u -v -s 4 -o <someFile.TssEnrichment>


import os
from multiprocessing import Pool
from optparse import OptionParser
import subprocess
import sys

# Plotting imports
#import matplotlib
#matplotlib.use('Agg')
#import matplotlib.pyplot as plt

import numpy as np
import pysam


#### OPTIONS ####
# read options from command line
usage = "usage: %prog [options] [inputs]"
opts = OptionParser(usage=usage)
opts.add_option("-a", help="<Reads> Accepts sorted BAM file")
opts.add_option("-b", help="<Bed> Accepts bed file")
opts.add_option("-o",help="OutputFile")
opts.add_option("-e",default="1000", help="number of bases to extend to each side, default=1000")
opts.add_option("-p",default="center", help="options:center,ends, default=center")
opts.add_option("-c",default="20",help="number of threads to use, default=20")
opts.add_option("-s",default='4',help="column in which strand information is located (1 being first), default=4")
opts.add_option("-u", action="store_true", default=False, help="Print uncompressed output file")
opts.add_option("-v", action="store_true", default=False, help="Print profile around bed file")
opts.add_option("-i", action="store_true", default=False, help="Print insert sizes across intervals")
opts.add_option("--window",default='20',help="window size for ploting")
options, arguments = opts.parse_args()

# return usage information if no argvs given
if len(sys.argv)==1:
    os.system(sys.argv[0]+" --help")
    sys.exit()

##### DEFINE FUNCTIONS #####
# assign mat
def asn_mat(val,mat,s_int,e_int,t,i,weight):
    if float(val)>=s_int and float(val)<e_int-1 and t<rows:  # -1 correct?
        base = val-s_int
        if len(p1_ints[0]) == 3:
            mat[t][base] += weight
        elif p1_ints[i][int(options.s)-1] == "-":
            mat[t][len(mat[0])-base-1] += weight	
        else:
            mat[t][base] += weight
    return mat

#compute Vplot Matrix for a particular chunk
def sub_Mat(start):
    # initialize data matrix
    mat = np.zeros([rows,cols])
    # loop through the intervals and get relevent info
    bamfile = pysam.Samfile(options.a, "rb")
    end=min(start+chunksize,len(p1_ints))
    for i in range(start,end):
        # get interval as num
        center = int(p1_ints[i][1])+(int(p1_ints[i][2])-int(p1_ints[i][1]))/2
        s_int=center-int(options.e)
        e_int=center+int(options.e)
        # Loop over reads.
        try:
            p2_reads = bamfile.fetch(str(p1_ints[i][0]), max(0, s_int - 2000), e_int + 2000)
        except ValueError:
            # Could print speculation about cause, but that may get wordy.
            # This is likely due to no reads for first argument to the fetch()
            # call; that is, the current "reference" value.
            continue
        for p2_rds in p2_reads:
            #check mapping quality
            if p2_rds.mapq<30:# or p2_rds.is_proper_pair==False:
                continue
            # get read positions
            if p2_rds.is_reverse:
		continue
            else:
		l_pos = p2_rds.pos+4
                # calculate center point
		ilen = abs(p2_rds.tlen)-9
                #ilen = 1
		r_pos=l_pos+ilen
		c_pos=l_pos+ilen/2
		if ilen%2==1 and options.p=='center':
			mat=asn_mat(c_pos,mat,s_int,e_int,ilen,i,0.5)
			mat=asn_mat(c_pos+1,mat,s_int,e_int,ilen,i,0.5)
		elif ilen%2!=1 and options.p=='center':
			mat=asn_mat(c_pos,mat,s_int,e_int,ilen,i,1)
		# save ends or read centers to v-plot
		elif options.p == 'ends':
			mat = asn_mat(l_pos,mat,s_int,e_int,ilen,i,1)
			mat = asn_mat(r_pos,mat,s_int,e_int,ilen,i,1)
		else:
			sys.exit('Error, check parameters')
    return mat

##### INPUTS AND OUTPUTS #####
# get intervals
p1_ints = np.loadtxt(options.b,'str')

##### SCRIPT #####

# determine number of rows and columns for matrix
rows = 1000
cols = int(options.e)*2

# split bedfile into chunks
maxi=len(p1_ints)
chunksize=maxi/int(options.c)
chunks=maxi/chunksize
starts=range(0,maxi,chunksize)

# parallel processed computation of matrix for each chunk
if __name__ == "__main__":
    pool = Pool(processes=int(options.c))
    sub_mats=pool.map_async(sub_Mat, starts,1).get(9999999)

# sum up matrices for each chunk into matrix for all
mat = np.zeros([rows,cols])
for i in range(len(starts)):
    mat=mat+sub_mats[i]
#asf
# get column vector
if options.v == True:
    mat = np.sum(mat,0)
if options.i == True:
    mat = np.sum(mat,1)

# save matrix
if not options.o:
    n1=os.path.basename(options.a)
    n2=os.path.basename(options.b)
    if options.v == True: options.o=n1+'.'+n2+'.vect'
    elif options.i == True: options.o=n1+'.'+n2+'.iSize'
    else: options.o=n1+'.'+n2+'.vplot'
if options.u == True:
    np.savetxt(options.o,mat,delimiter='\t',fmt='%s')
else:
    np.save(options.o,mat)


#UNUSED PLOTTING FEATURES BELOW
# plot
# fig=plt.figure(figsize=(8.0, 5.0))
# xran=min(500,int(options.e))
# yran=min(500,rows)
# if options.v == True:
    # plt.plot(mat/np.mean(mat[1:200]),'k.')
    # plt.plot(np.convolve(mat,np.ones(int(options.window)),'same')/int(options.window)/np.mean(mat[1:200]),'r')
    # plt.xlabel('Position relative to center')
    # plt.ylabel('Insertions')
# elif options.i == True:
    # plt.plot(mat[0:990])
    # plt.xlabel('Insert size (bp)')
    # plt.ylabel('Count')
# else:
    # plt.imshow(mat[0:yran,(int(options.e)-xran):(int(options.e)+xran+1)],origin='lower',aspect='equal',extent=[-xran,xran,1,yran+1])
    # plt.xlabel('Position relative to center')
    # plt.ylabel('Insert size')

# save figure
#fig.savefig(options.o+'.png')
#fig.savefig(options.o+'.pdf', format='pdf')
#plt.close(fig)

#Call ATAC_Rscript_TSSenrichmentPlot_pyPiper.R to make TSS plot
# cmd = "Rscript "
# cmd += os.path.dirname(os.path.realpath(sys.argv[0])) + "/ATAC_Rscript_TSSenrichmentPlot_pyPiper.R"
# cmd += " --TSSfile " + options.o + " --outputType pdf"
# subprocess.call(cmd, shell=True)
