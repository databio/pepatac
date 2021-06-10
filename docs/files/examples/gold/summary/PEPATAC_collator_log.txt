### Pipeline run code and environment:

*              Command:  `/scratch/jps3dp/tools/databio//pepatac/pipelines/pepatac_collator.py --config /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/examples/gold_atac/metadata/project_config.yaml -O /project/shefflab/processed//pepatac/gold_atac -P 1 -M 48000 -n gold -r /project/shefflab/processed//pepatac/gold_atac/results_pipeline`
*         Compute host:  udc-ba25-17
*          Working dir:  /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac
*            Outfolder:  /project/shefflab/processed/pepatac/gold_atac/summary/
*  Pipeline started at:   (09-15 06:45:54) elapsed: 28.0 _TIME_

### Version log:

*       Python version:  3.7.4
*          Pypiper dir:  `/sfs/qumulo/qhome/jps3dp/.local/lib/python3.7/site-packages/pypiper`
*      Pypiper version:  0.12.1
*         Pipeline dir:  `/sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/pipelines`
*     Pipeline version:  0.0.2
*        Pipeline hash:  9d04c5b9b64523ab57a715a490430311eef462bb
*      Pipeline branch:  * master
*        Pipeline date:  2020-09-08 11:15:59 -0400
*        Pipeline diff:  3 files changed, 8 insertions(+), 7 deletions(-)

### Arguments passed to pipeline:

*        `config_file`:  `/sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/examples/gold_atac/metadata/project_config.yaml`
*              `cores`:  `1`
*              `dirty`:  `False`
*       `force_follow`:  `False`
*             `logdev`:  `False`
*                `mem`:  `48000`
*               `name`:  `gold`
*          `new_start`:  `False`
*      `output_parent`:  `/project/shefflab/processed//pepatac/gold_atac`
*            `recover`:  `False`
*            `results`:  `/project/shefflab/processed//pepatac/gold_atac/results_pipeline`
*             `silent`:  `False`
*     `skip_consensus`:  `False`
*         `skip_table`:  `False`
*           `testmode`:  `False`
*          `verbosity`:  `None`

----------------------------------------

Target to produce: `/project/shefflab/processed/pepatac/gold_atac/summary/gold_libComplexity.pdf`,`/project/shefflab/processed/pepatac/gold_atac/summary/gold_*_consensusPeaks.narrowPea`,`/project/shefflab/processed/pepatac/gold_atac/summary/gold_peaks_coverage.tsv`  

> `Rscript /scratch/jps3dp/tools/databio//pepatac/tools/PEPATAC_summarizer.R /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/examples/gold_atac/metadata/project_config.yaml /project/shefflab/processed//pepatac/gold_atac /project/shefflab/processed//pepatac/gold_atac/results_pipeline` (9246)
<pre>
Loading config file: /sfs/lustre/bahamut/scratch/jps3dp/tools/databio/pepatac/examples/gold_atac/metadata/project_config.yaml
Creating assets summary...
Summary (n=5): /project/shefflab/processed//pepatac/gold_atac/gold_assets_summary.tsv
Creating summary plots...
5 of 5 library complexity files available.
INFO: Found real counts for gold1 - Total (M): 95.428628 Unique (M): 91.424654
INFO: Found real counts for gold2 - Total (M): 14.945076 Unique (M): 14.399146
INFO: Found real counts for gold3 - Total (M): 114.30837 Unique (M): 108.002922
INFO: Found real counts for gold4 - Total (M): 71.445462 Unique (M): 69.367736
INFO: Found real counts for gold5 - Total (M): 72.038212 Unique (M): 69.508938

Successfully produced project summary plots.

Warning message:
In PEPATACr::peakCounts(prj, argv$output, argv$results, assets) :
  Peak coverage files are not derived from a singular reference peak set.
</pre>
Command completed. Elapsed time: 0:00:13. Running peak memory: 0.082GB.  
  PID: 9246;	Command: Rscript;	Return code: 0;	Memory used: 0.082GB


### Pipeline completed. Epilogue
*        Elapsed time (this run):  0:00:41
*  Total elapsed time (all runs):  0:00:13
*         Peak memory (this run):  0.0821 GB
*        Pipeline completed time: 2020-09-15 06:46:08
