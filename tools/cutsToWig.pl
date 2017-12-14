# By Nathan Sheffield, University of Virginia, 2017

# This is an incredibly fast Perl utility that converts cut sites
# (coordinates) into a wiggle-like output.
# Input: a sorted list of integers, corresponding to bases of interest
# Input #2: an integer (length of chromosome) to fill up with 0s in at the end
# Output: newline-separated integers counting how many of each site
# was present in the input.

# Perl is the right language for this utility; because this is a high
# IO task (spitting out hundreds of millions of lines), and Perl is highly
# optimized for this type of IO process. A corresponding python
# program will take 10-100 fold longer to do the same thing.

# Run it like this.
# 1. Pipe your cuts into cutsToWig via stdin:
# cat cuts.txt | cutsToWig.pl CHROMSIZE > out.wig
# or you can pass your cuts file on the command line:
# cutsToWig.pl CHROMSIZE cuts.txt > out.wig

# It's also useful to pipe this to the ucsc tool for bigwig compression:
# cat cuts.txt | cutsToWig.pl CHROMSIZE | wigToBigWig -clip stdin chrom_sizes.txt out.bw

# Setup
$chrSize = shift;  # Size of chromosome is the first argument
$countIndex = 1;
$currentCount = 1;
$header =  <>; # Discard the first line (fixedstep)
print $header;
$cutSite = <>;  # Grab the first cut

# Print out 0s until the first cut
while ($countIndex < $cutSite) {
	print "0\n";
	$countIndex++;	
}
$previousCut = $cutSite;

# Loop through cuts, converting to wiggle format
while($cutSite = <>) {
	chomp($cutSite);
	# if it's a duplicate read...
	if ($cutSite == $previousCut) { # sum up all reads for this spot.
		$currentCount++;
		next;						# skip to next read
	}

	# otherwise, it makes it past this loop;
	# output the sum of counts for the previous spot
	print $currentCount."\n"; 
	$countIndex++;
	# reset for the current spot
	$currentCount = 1;
	# and print out all 0s between them
	while ($countIndex < $cutSite) {
		print "0\n";
		$countIndex++;	
	}
	$previousCut = $cutSite;
} # end while

# Finish chromosome by printing 0s until we each the end.
while($countIndex <= $chrSize) {
	print "0\n";
	$countIndex++;
}
