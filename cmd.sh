# using pre-fix of fastq file 
#python pipelines/ATACseq.py  -P 3 -M 100 -O test_out -R -S liver -G mm9  -Q paired  -C ATACseq.yaml  -gs mm -I test_data/liver-CD31_test_R1.fastq.gz -I2 test_data/liver-CD31_test_R2.fastq.gz  
python pipelines/ATACseq.py  -P 3 -M 100 -O test_out -R -S liver -G hg19  -Q paired  -C ATACseq.yaml  -gs mm -I test_data/liver-CD31_test_R1.fastq.gz -I2 test_data/liver-CD31_test_R2.fastq.gz  
