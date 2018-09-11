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
my %bhash; 

# load 10000 read names into buffer
for ($r = 1; $r < 10000; $r++) {
	$readname = <$fh>;
	$readname =~ s/[\s\/].*$//;
	<$fh>;<$fh>;<$fh>;
	chomp($readname);
	$bhash{$readname} = 1;
	# print $readname;
}

# print "$_\n" for keys %bhash;
# print "BLAH\n\n";
while($readname2 = <$fh2>) {
	$readname2_copy = $readname2;
	$readname2 =~ s/[\s\/].*$//;
	# if ($skipped < 50) { print STDERR ($readname2)};
	chomp($readname2);
	# if ("$readname" eq "$readname2") {
	if (exists $bhash{$readname2}) {
 		print $readname2_copy;
 		print $line = <$fh2>;
 		print $line = <$fh2>;
 		print $line = <$fh2>;
 		delete $bhash{$readname2};
 		# Read in a new one:
 		$readname = <$fh>;
		$readname =~ s/[\s\/].*$//;
		<$fh>;<$fh>;<$fh>;
		chomp($readname);
		$bhash{$readname} = 1;
	} else {
		# advance to next r2 read
 		$skipped++;
		<$fh2>.<$fh2>.<$fh2>;
	}
}


print STDERR $skipped." skipped";
