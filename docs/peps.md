## Configure your `PEP` project files

To run your own samples, you'll need to organize them in **PEP format**, which is explained in [how to create a PEP](http://pep.databio.org/en/latest/simple_example/) and is universal to all pipelines that read PEPs, including `PEPATAC`. To get you started, there are multiple examples you can adapt in the `examples/` folder (*e.g.* [example test PEP](https://github.com/databio/pepatac/tree/master/examples/test_project)). In short, you need two files for your project:

  1. project config file -- describes output locations, pointers to data, etc.
  2. sample table file -- comma-separated value (CSV) list of your samples.

The sample table file must specify these columns:

- sample_name
- library ('ATAC' or 'ATACSEQ' or 'ATAC-seq')
- organism (e.g. 'human', 'mouse', or 'drosophila' et cetera)
- read1
- read2
- whatever else you want

