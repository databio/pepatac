### Pipeline run code and environment:

*              Command:  `/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/pipelines/pepatac_collator.py --config /sfs/lustre/bahamut/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/tutorial/tutorial.yaml -O /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/ -P 1 -M 16000 -n PEPATAC_tutorial -r /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline`
*         Compute host:  udc-ba35-36
*          Working dir:  /sfs/lustre/bahamut/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac
*            Outfolder:  /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/summary/
*  Pipeline started at:   (09-22 08:02:59) elapsed: 16.0 _TIME_

### Version log:

*       Python version:  3.7.4
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python3.7/site-packages/pypiper`
*      Pypiper version:  0.12.1
*         Pipeline dir:  `/sfs/lustre/bahamut/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/pipelines`
*     Pipeline version:  0.0.2
*        Pipeline hash:  ee6500ecf6fdc9cf3b1890635d7ee92206ddc58b
*      Pipeline branch:  * master
*        Pipeline date:  2020-09-21 10:57:52 -0400
*        Pipeline diff:  2 files changed, 9 insertions(+), 9 deletions(-)

### Arguments passed to pipeline:

*        `config_file`:  `/sfs/lustre/bahamut/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/tutorial/tutorial.yaml`
*              `cores`:  `1`
*              `dirty`:  `False`
*       `force_follow`:  `False`
*             `logdev`:  `False`
*                `mem`:  `16000`
*               `name`:  `PEPATAC_tutorial`
*          `new_start`:  `False`
*      `output_parent`:  `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/`
*            `recover`:  `False`
*            `results`:  `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline`
*             `silent`:  `False`
*     `skip_consensus`:  `False`
*         `skip_table`:  `False`
*           `testmode`:  `False`
*          `verbosity`:  `None`

----------------------------------------

Target to produce: `/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/summary/PEPATAC_tutorial_libComplexity.pdf`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/summary/PEPATAC_tutorial_*_consensusPeaks.narrowPea`,`/scratch/jps3dp/data/tmp/pepatac_tutorial/processed/summary/PEPATAC_tutorial_peaks_coverage.tsv`  

> `Rscript /scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/tools/PEPATAC_summarizer.R /sfs/lustre/bahamut/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/tutorial/tutorial.yaml /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/ /scratch/jps3dp/data/tmp/pepatac_tutorial/processed/results_pipeline` (23066)
<pre>
Loading config file: /sfs/lustre/bahamut/scratch/jps3dp/data/tmp/pepatac_tutorial/tools/pepatac/examples/tutorial/tutorial.yaml
Creating assets summary...
Summary (n=2): /scratch/jps3dp/data/tmp/pepatac_tutorial/processed//PEPATAC_tutorial_assets_summary.tsv
Creating summary plots...
1 of 2 library complexity files available.
INFO: Found real counts for tutorial1 - Total (M): 0.87693 Unique (M): 0.87693

Successfully produced project summary plots.

Calculating hg38 consensus peak set from 2 samples...
Consensus peak set: /scratch/jps3dp/data/tmp/pepatac_tutorial/processed//summary/PEPATAC_tutorial_hg38_consensusPeaks.narrowPeak

Warning message:
In PEPATACr::peakCounts(prj, argv$output, argv$results, assets) :
  Peak coverage files are not derived from a singular reference peak set.
</pre>
Command completed. Elapsed time: 0:00:52. Running peak memory: 0.827GB.  
  PID: 23066;	Command: Rscript;	Return code: 0;	Memory used: 0.827GB


### Pipeline completed. Epilogue
*        Elapsed time (this run):  0:01:09
*  Total elapsed time (all runs):  0:00:52
*         Peak memory (this run):  0.8265 GB
*        Pipeline completed time: 2020-09-22 08:03:51
