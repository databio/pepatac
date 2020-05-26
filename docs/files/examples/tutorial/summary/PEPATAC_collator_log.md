### Pipeline run code and environment:

*              Command:  `/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac_collator.py --config /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/examples/tutorial/tutorial.yaml -O /home/jps3dp/tutorial/ -P 1 -M 4000 -n PEPATAC_tutorial -r /home/jps3dp/tutorial/results_pipeline`
*         Compute host:  udc-ba35-36
*          Working dir:  /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac
*            Outfolder:  /home/jps3dp/tutorial/summary/
*  Pipeline started at:   (05-26 13:30:25) elapsed: 2.0 _TIME_

### Version log:

*       Python version:  3.6.6
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python3.6/site-packages/pypiper`
*      Pypiper version:  0.12.1
*         Pipeline dir:  `/sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/pipelines`
*     Pipeline version:  0.0.2
*        Pipeline hash:  cbb01a4f15c4bb06ca2c6ba88a2907021c13bb5d
*      Pipeline branch:  * cfg2
*        Pipeline date:  2020-05-26 10:14:13 -0400
*        Pipeline diff:  2 files changed, 44 insertions(+), 42 deletions(-)

### Arguments passed to pipeline:

*        `config_file`:  `/sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/examples/tutorial/tutorial.yaml`
*              `cores`:  `1`
*              `dirty`:  `False`
*       `force_follow`:  `False`
*             `logdev`:  `False`
*                `mem`:  `4000`
*               `name`:  `PEPATAC_tutorial`
*          `new_start`:  `False`
*      `output_parent`:  `/home/jps3dp/tutorial/`
*            `recover`:  `False`
*            `results`:  `/home/jps3dp/tutorial/results_pipeline`
*             `silent`:  `False`
*           `testmode`:  `False`
*          `verbosity`:  `None`

----------------------------------------

Target to produce: `/home/jps3dp/tutorial/summary/PEPATAC_tutorial_libComplexity.pdf`,`/home/jps3dp/tutorial/summary/PEPATAC_tutorial_*_consensusPeaks.narrowPea`,`/home/jps3dp/tutorial/summary/PEPATAC_tutorial_peaks_coverage.tsv`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_summarizer.R /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/examples/tutorial/tutorial.yaml /home/jps3dp/tutorial/ /home/jps3dp/tutorial/results_pipeline` (48176)
<pre>
Loading config file: /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/examples/tutorial/tutorial.yaml
Creating assets summary...
Summary (n=1): /home/jps3dp/tutorial//PEPATAC_tutorial_assets_summary.tsv
1 of 1 library complexity files available.
INFO: Found real counts for tutorial - Total (M): 1.752746 Unique (M): 1.752746

Successfully produced project summary plots.

Creating consensus peak set...
Warning message:
In PEPATACr::consensusPeaks(prj, argv$output, argv$results, assets) :
  Found only a single valid peak file for hg38.
Creating gene count table...
Counts table: /home/jps3dp/tutorial//summary/PEPATAC_tutorial_peaks_coverage.tsv

Warning message:
In PEPATACr::peakCounts(prj, argv$output, argv$results, assets) :
  Peak coverage files are not derived from a singular reference peak set.
</pre>
Command completed. Elapsed time: 0:00:21. Running peak memory: 0.62GB.  
  PID: 48176;	Command: Rscript;	Return code: 0;	Memory used: 0.62GB


### Pipeline completed. Epilogue
*        Elapsed time (this run):  0:00:23
*  Total elapsed time (all runs):  0:00:21
*         Peak memory (this run):  0.6204 GB
*        Pipeline completed time: 2020-05-26 13:30:47
