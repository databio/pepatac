#! /usr/bin/env perl
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
$file_filter = shift;
$file_fq1 = shift;
$file_fq2 = shift;
$file_fq1_filtered = shift;
$file_fq2_filtered = shift;
open(my $fh_filter, "<", $file_filter);
# We can't read from compressed input because it messes with the way the files
# are read in, but this is how you would do it.
# if ($file_fq1 =~ /\.gz$/i) {
# 	open(my $fh_fq1, "gunzip -c $file_fq1 |");
# } else {
# 	open(my $fh_fq1, "<", $file_fq1);
# }
# if ($file_fq2 =~ /\.gz$/i) {
# 	open(my $fh_fq2, "gunzip -c $file_fq2 |");
# } else {
# 	open(my $fh_fq2, "<", $file_fq2);
# }
open(my $fh_fq1, "<", $file_fq1);
open(my $fh_fq2, "<", $file_fq2);

# write output files here
if ($file_fq1_filtered =~ /\.gz$/i) {
	print STDERR "gzipping output\n";
	open(FH_FQ1_FILT, "| /bin/gzip -c > $file_fq1_filtered");
} else {
	print STDERR "not gzipping output\n";
	open(FH_FQ1_FILT, ">", $file_fq1_filtered);
}

if ($file_fq2_filtered =~ /\.gz$/i) {
	open(FH_FQ2_FILT, "| /bin/gzip -c > $file_fq2_filtered");
} else {
	open(FH_FQ2_FILT, ">", $file_fq2_filtered);
}



# Loop through reads
my $skipped = 0;
my %bhash; 

# load some read names into buffer
for ($r = 1; $r < 1000000; $r++) {
	$readnamef = <$fh_filter> or last;
	$readnamef =~ s/[\s\/].*$//;
	<$fh_filter>;<$fh_filter>;<$fh_filter>;
	chomp($readnamef);
	$bhash{$readnamef} = 1;
	# print $readname;
}

# print "$_\n" for keys %bhash;
# print "BLAH\n\n";
while($readname2 = <$fh_fq2>) {
	$readname1 = <$fh_fq1>;
	$readname2_copy = $readname2;
	$readname2 =~ s/[\s\/].*$//;
	# if ($skipped < 50) { print STDERR ($readname2)};
	chomp($readname2);
	# if ("$readname" eq "$readname2") {
	if (exists $bhash{$readname2}) {
 		print FH_FQ2_FILT $readname2_copy;
 		print FH_FQ2_FILT $line = <$fh_fq2>;
 		print FH_FQ2_FILT $line = <$fh_fq2>;
 		print FH_FQ2_FILT $line = <$fh_fq2>;
 		print FH_FQ1_FILT $readname1;
 		print FH_FQ1_FILT $line = <$fh_fq1>;
 		print FH_FQ1_FILT $line = <$fh_fq1>;
 		print FH_FQ1_FILT $line = <$fh_fq1>;
 		
 		delete $bhash{$readname2};
 		# Parse in a new read from the filter:
 		if ($readnamef = <$fh_filter>) {
			$readnamef =~ s/[\s\/].*$//;
			<$fh_filter>;<$fh_filter>;<$fh_filter>;
			chomp($readnamef);
			$bhash{$readnamef} = 1;
		}
	} else {
		# advance to next r2 read
 		$skipped++;
		<$fh_fq2>.<$fh_fq2>.<$fh_fq2>;
		<$fh_fq1>.<$fh_fq1>.<$fh_fq1>;
	}
}

close(FH_FQ1_FILT);
close(FH_FQ2_FILT);

$lost_reads_count = keys %bhash;
print STDERR $skipped." reads skipped\n";
print STDERR $lost_reads_count." reads lost\n";
if ($lost_reads_count < 200) {
	print STDERR "$_\n" for keys %bhash;
}
