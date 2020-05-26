#! /usr/bin/env perl

# By Nathan Sheffield, University of Virginia, 2017
# Update 03.04.19 - Jason Smith - Add option to use variable or fixedStep
# Update 05.14.19 - Jason Smith - Fix variableStep use
# Update 05.14.20 - Jason Smith - Add scaling factor

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
# cat cuts.txt | cutsToWig.pl CHROMSIZE FALSE > out.wig
# or you can pass your cuts file on the command line:
# cutsToWig.pl CHROMSIZE FALSE cuts.txt > out.wig

# It's also useful to pipe this to the ucsc tool for bigwig compression:
# cat cuts.txt | cutsToWig.pl CHROMSIZE FALSE | wigToBigWig -clip stdin chrom_sizes.txt out.bw

# Setup
my $chrSize = shift;       # Size of chromosome is the first argument
my $variableStep = shift;  # Second argument is whether to use variable or fixed
my $scale = shift;         # Third argument is scaling factor
$countIndex = 1;
$currentCount = 1;
$header =  <>;  # Grab the first line (e.g. the header)
print $header;

$cutSite = <>;  # Grab the first cut
chomp($cutSite);

if ($variableStep) {  # Use variableStep wiggle format
	$previousCut = $cutSite;

	# Loop through cuts, converting to wiggle format
	if (length $cutSite == 0) {
		print "$chrSize\t0\n";
	} else {
		$chomps = 0;
		while($cutSite = <>) {
			chomp($cutSite);
			$chomps++;		
			# if it's a duplicate read...
			if ($cutSite == $previousCut) { # sum up all reads for this spot.
				$currentCount++;
				next;						# skip to next read
			}
			# otherwise, it makes it past this loop;
			# output the sum of counts for the previous spot
            $scaledCount = $currentCount/$scale;
			print "$previousCut\t$scaledCount\n";
			# reset for the current spot
			$currentCount = 1;
			$previousCut = $cutSite;
		} # end while
		# If there are no additional cutSites
		if ($currentCount == 1) {
			print "$chrSize\t0\n";
		}
	}
} else {  # Use fixedStep wiggle format
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
        $scaledCount = $currentCount/$scale;
		print $scaledCount."\n"; 
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
}