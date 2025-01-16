
# Basic MicroTests

#### Execution time should be less than 5 minutes.

This test assumes you've pulled the microtest repository and that it is parallel with the pepatac folder.
`https://github.com/databio/microtest.git`

Navigate to this folder and run:

`looper run -c .looper_microtest_basic.yaml`

For a 2nd set of options, run:

`looper run -c .looper_microtest_basic_02.yaml`

For the 2nd test, you will need to set the paths to the picard and trimmomatic jar files:
`export PICARD=/picard-2.27.5-0/picard.jar`
`export TRIMMOMATIC=/trimmomatic-0.39-2/trimmomatic.jar`