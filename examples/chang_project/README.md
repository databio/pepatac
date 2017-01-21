### Chang lab configuration sample project

This folder contains an skeleton template with configuration options already set for the Chang lab compute environment. To set up a new project in the chang lab compute environment, follow these instructions:

1. Follow the **installing** instructions in the main README to get prerequisites.
2. Copy this folder [examples/chang_project](examples/chang_project/) to a new directory.
3. In the `project_config.yaml`, set the `metadata.pipelines_dir` option to the location of your cloned ATACseq repository.
4. Make any other (optional) changes you want to `project_config.yaml`, like adjusting the file location to where you store the fastq files.
5. Modify `project_annotation.csv` to include your sample list.
6. Run the project with `looper run path/to/project_config.yaml`.

Essentially, all this does differently from the default is that we have provided a configuration file. See the `pipeline_config` section in the [project config file](examples/chang_project/project_config.yaml) -- we simply set this to `ATACseq_chang.yaml` for your project, and then include [ATACseq_chang.yaml](examples/chang_project/ATACseq_chang.yaml) parallel to the project config file.