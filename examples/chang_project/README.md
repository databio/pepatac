### Chang lab configuration sample project

This folder contains an skeleton template with configuration options already set for the Chang lab compute environment. To set up a new project in the Chang lab compute environment, follow these instructions:

1. Follow the **installing** instructions in the main README to get prerequisites (install looper, pypiper, and clone the PEPATAC repository).
2. Copy this folder ([examples/chang_project](examples/chang_project/)) and name the new folder for your project.
3. In your new folder, edit `project_config.yaml` to set the `metadata.pipelines_dir` option to the location of your cloned PEPATAC repository.
4. Edit `project_config.yaml` to set the `data_sources.R1` and `data_sources.R2`  to point to where you store fastq files. Your files must be named in some systematic pattern that can be created by populating sample variables, like `{sample_name}`. Detailed instructions are available here: [using looper derived columns](http://looper.readthedocs.io/en/latest/advanced.html#pointing-to-flexible-data-with-derived-columns).
5. Make any other (optional) changes you want to `project_config.yaml`.
6. Modify `project_annotation.csv` to include your sample list.
7. Run the project with `looper run path/to/project_config.yaml`.

Essentially, all this does differently from the default is that we have provided a configuration file. See the `pipeline_config` section in the [project config file](examples/chang_project/project_config.yaml) -- we simply set this to `pepatac_chang.yaml` for your project, and then include [pepatac_chang.yaml](examples/chang_project/pepatac_chang.yaml) parallel to the project config file. 

Once you have it set up, you have all the power of looper for your project. It's simple to submit to a cluster, summarize your results, clean, and monitor your project. You can find additional details on what you can do with this in the [looper docs](http://looper.readthedocs.io/).