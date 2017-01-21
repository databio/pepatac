#!/urs/bin/perl


$bam_file = @ARGV[0];
$outfile = @ARGV[1];



open(out,">$outfile");

open(in, "samtools view -f 0x0002 $bam_file|"); 
while($line=<in>){
	chomp $line;
	@data = split /\t/, $line;
	$read_id = $data[0];
	$flag = $data[1];
	$chr = $data[2];
	$flag_length = abs($data[8]);
	if ($flag ==99 || $flag==163) {
		print out $flag_length."\n";
	} 
}
close in;
close out;
