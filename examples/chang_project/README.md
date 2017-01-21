### Chang lab configuration sample project

This folder contains an skeleton template with configuration options already set for the Chang lab compute environment. To set up a new project in the Chang lab compute environment, follow these instructions:

1. Follow the **installing** instructions in the main README to get prerequisites (install looper, pypiper, and clone the ATACseq repository).
2. Copy this folder ([examples/chang_project](examples/chang_project/)) and name the new folder for your project.
3. In your new folder, edit `project_config.yaml` to set the `metadata.pipelines_dir` option to the location of your cloned ATACseq repository.
4. Edit `project_config.yaml` to set the `data_sources.read1` and `data_sources.read2`  to point to where you store fastq files. Your files must be named in some systematic pattern that can be created by populating sample variables, like `{sample_name}`.
5. Make any other (optional) changes you want to `project_config.yaml`.
6. Modify `project_annotation.csv` to include your sample list.
7. Run the project with `looper run path/to/project_config.yaml`.

Essentially, all this does differently from the default is that we have provided a configuration file. See the `pipeline_config` section in the [project config file](examples/chang_project/project_config.yaml) -- we simply set this to `ATACseq_chang.yaml` for your project, and then include [ATACseq_chang.yaml](examples/chang_project/ATACseq_chang.yaml) parallel to the project config file.