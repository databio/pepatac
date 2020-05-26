#! /usr/bin/env perl

# By Nathan Sheffield, University of Virginia, 2018

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
# 1. Pipe your cuts in via stdin:
# cat cuts.txt | smoothWig.pl CHROMSIZE SMOOTH_LENGTH > out.wig
# or you can pass your cuts file on the command line:
# cutsToWig.pl CHROMSIZE SMOOTH_LENGTH cuts.txt > out.wig

# It's also useful to pipe this to the ucsc tool for bigwig compression:
# cat cuts.txt | cutsToWig.pl CHROMSIZE | wigToBigWig -clip stdin \
# chrom_sizes.txt out.bw

# Setup
my $chrSize = shift;       # Size of chromosome is the first argument
my $smoothSize = shift;    # Smooth size is 2nd argument
my $stepSize = shift;      # Step size
my $variableStep = shift;  # Fourth argument is whether to use variable or fixed
my $scale = shift;         # Fifth argument is scaling factor

$countIndex = 1;
$currentCount = 0;
$header =  <>;  # Grab the first line (e.g. the header)
print $header;

# The strategy here is to make a smoothed signal track (bigwig file) given the
# exact base-pair locations of the signals. We want to extend those signals out
# +/- some number. The problem is, this messes up sorting, so you can't simply
# split every value into a range surrounding it, because then you have to
# re-sort. This script uses an alternative algorithm that avoids that resorting
# step, resulting in better performance.

# We conceptualize a nucleotide signal (or 'cut site') as a start and an end. We
# loop through each value and handle it as a start, while pushing the
# corresponding end onto a deque. We will then pull out the oldest 'end' items
# from the deque as we process through the values. Each new value increments the
# emitted value, while each 'closing' value decrements it.

# We initiate an array of 'closers', which are positions that will decrement the
# signal output (end points of a smoothed cut)
my @closers;

$cutSite = <>; # Grab the first cut
$cutSite -= $smoothSize;
$endSite = $cutSite + $smoothSize*2;

if ($variableStep) {
	# Cycle to the first cut
	while ($countIndex < $cutSite) {
		$countIndex += $stepSize;	
	}
	$previousCut = $cutSite;

	# Loop through cuts, converting to wiggle format
	while($cutSite = <>) {
		$cutSite -= $smoothSize;
		$currentCount++;
		push @closers, $cutSite + $smoothSize*2;
		chomp($cutSite);
		# if it's a duplicate read...
		if ($cutSite == $previousCut) {
			next;  # skip to next read
		}

		while ($countIndex < $cutSite) {
			while ($endSite == $countIndex) {
				$currentCount--;
				$endSite = shift @closers;
			}

			if ($countIndex % $stepSize == 0) {
                $scaledCount = $currentCount/$scale;
				print "$countIndex\t$scaledCount\n";
			}
			$countIndex++;
		}

		$previousCut = $cutSite;
	} # end while

	# Finish chromosome by cycling until we each the end.
	while($countIndex <= $chrSize) {
		while ($endSite == $countIndex) {
			$currentCount--;
			$endSite = shift @closers;
		}
		if ($countIndex % $stepSize == 0) {
            $scaledCount = $currentCount/$scale;
			print "$countIndex\t$scaledCount\n";
		}
		$countIndex++;	
	}
} else {  # Use fixedStep wiggle format
	# Print out 0s until the first cut
	while ($countIndex < $cutSite) {
		print "0\n";
		$countIndex += $stepSize;	
	}
	$previousCut = $cutSite;

	# Loop through cuts, converting to wiggle format
	while($cutSite = <>) {
		$cutSite -= $smoothSize;
		$currentCount++;
		push @closers, $cutSite + $smoothSize*2;
		chomp($cutSite);
		# if it's a duplicate read...
		if ($cutSite == $previousCut) {
			next; # skip to next read
		}

		# and print out all 0s between them
		while ($countIndex < $cutSite) {
			# print ":".$countIndex.":".$endSite.":";
			while ($endSite == $countIndex) {
				$currentCount--;
				$endSite = shift @closers;
			}
			if ($countIndex % $stepSize == 0) {
                $scaledCount = $currentCount/$scale;
				print "$scaledCount\n";
			}
			$countIndex++;
		}

		$previousCut = $cutSite;
	} # end while

	# Finish chromosome by printing 0s until we each the end.
	while($countIndex <= $chrSize) {
		while ($endSite == $countIndex) {
			$currentCount--;
			$endSite = shift @closers;
		}
		if ($countIndex % $stepSize == 0) {
            $scaledCount = $currentCount/$scale;
			print "$scaledCount\n";
		}
		$countIndex++;	
	}
}
