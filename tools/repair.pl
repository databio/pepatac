#!/bin/env perl 
# By Nathan Sheffield, University of Virginia, 2018

# This is an incredibly fast Perl utility that re-pairs fastq files that have been 
# de-paired by running a single-end alignment on paired-end data. 
# It assumes that the the first fastq file (say, read1) contains a subset of reads
# found in the second fastq file (say, read2). 
# It also assumes that the files were in proper order to begin with.
# It will return a filtered version of the second file, which only has reads
# present in the first tile.

# Perl is the right language for this utility; because this is a high
# IO task (spitting out hundreds of millions of lines), and Perl is highly
# optimized for this type of IO process. A corresponding python
# program will take 10-100 fold longer to do the same thing.

# Setup
$file1 = shift;  
$file2 = shift;
open(my $fh, "<", $file1);
open(my $fh2, "<", $file2);

# Loop through reads
my $skipped = 0;
while($readname = <$fh>) {
	$readname =~ s/[\s\/].*$//;
	chomp($readname);
	<$fh>;<$fh>;<$fh>;
	while($readname2 = <$fh2>) {
		$readname2 =~ s/[\s\/].*$//;
		chomp($readname2);
	 	if ("$readname" eq "$readname2") {
	 		print $readname2."/2\n";
	 		print $line = <$fh2>;
	 		print $line = <$fh2>;
	 		print $line = <$fh2>;
	 		last;
 		} else {
	 		$skipped++;
 			<$fh2>;<$fh2>;<$fh2>;
 		}
	}
}

print STDERR $skipped." skipped";
