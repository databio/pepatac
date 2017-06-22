#!/usr/bin/perl
# March 2011 by Nathan Sheffield, Duke
$usage = "
This script takes a bedSorted .bed file with sequences and converts it into a wiggle track
mapping the exact locations of the cuts, one cut for each sequence.
for chrom sizes I'd like ucsc chromInfo files.
usage:
bedToExactWig.pl <file.bed> <chrom_sizes.txt> <output_folder>\n";

unless ($#ARGV > 0) { die $usage };
#############

# Bed file of alignments
$file = shift(@ARGV);
open(ALIGNMENT, "$file") || die("Could not open $file\n");

#Chromosome sizes
$cs = shift(@ARGV);
open(CS, "$cs") || die("Could not open $cs\n");
while ($line = <CS>) {
    chomp($line);
    ($chr, $chr_size) = split('\t',$line);
    $chr = substr($chr, 3);
    $chr_size{$chr} = $chr_size;
    #print stderr "$chr is size $chr_size{$chr}\n";
}

$outfolder = shift(@ARGV);

#First, find where all the cut sites are and spit to a temporary file.
my $currentChromosome = "";
while ($line = <ALIGNMENT>) {
    chomp($line);
    ($chr, $start, $end, $name, $score, $strand, @rest) = split("\t",$line);
    $chr = substr($chr, 3);
	#next unless ($chr eq "X" | $chr eq "Y");
	my $cutSite;
	if ($chr ne $currentChromosome) {#initial read
		#finish old chromosome.
		if ($currentChromosome ne "") {
			close(CUTS);
			makeWiggle($currentChromosome);
		}
		#start new chr
		$currentChromosome = $chr;
		print(STDERR "chr$chr: Finding cut sites (chr$chr.cuts.temp)...\n");
		open(CUTS, ">$outfolder/chr$chr.cuts.temp");
	}
	# DNASE:
	# if ($dnase) {
	# 	if ($strand eq "+") { $cutSite = $start+1; } else { $cutSite = $end; }
	# 	print CUTS $cutSite."\n";
	# 	} else { 
	# 	#ATAC
		$cutSite = $start+25;  # account for 25bp shift in bam2bed_shift.pl (TODO: Fix this)
		print CUTS $cutSite."\n";
	# }
	#if ($cutCount++ == 100) { print CUTS "\n"; $cutCount = 0; }
}
close(CUTS);#last chromosome
makeWiggle($currentChromosome);
system(`rm $outfolder/*.cuts.temp`);#cleanup temp files.
exit();


sub makeWiggle {
	#Step two, reads the temporary cuts file and generates the final wig.
	my $currentChromosome = $_[0];
	open(CUTS, "sort -n $outfolder/chr$currentChromosome.cuts.temp |");
	print STDERR "Making chr$currentChromosome.wig ($chr_size{$currentChromosome})...\n";
	$begin=1;
#	if ($currentChromosome eq "22") {			$begin = 14430000;	} 
#	elsif ($currentChromosome eq "21") {		$begin = 9411193;	}
#	elsif ($currentChromosome eq "15") {		$begin = 18260000;	} 
#	elsif ($currentChromosome eq "14") {		$begin = 18070000;	} 
#	elsif ($currentChromosome eq "13") {		$begin = 17918000;	} 
#	else {	$begin = 1;		}

	#open(OUT, ">$outfolder/chr$currentChromosome.wig");
	# pipe straight to wigToBigWig per chrom.
	open(OUT, "| wigToBigWig -clip -fixedSummaries -keepAllChromosomes stdin $cs $outfolder/chr$currentChromosome.bw");
	print OUT "fixedStep chrom=chr$currentChromosome start=$begin step=1\n";

	$countIndex=$begin;
	$currentCount=1;
	my $cutSite = <CUTS>;
	while ($countIndex < $cutSite) {
		print OUT "0\n";
		$countIndex++;	
	}
	$previousCut=$cutSite;

	while($cutSite = <CUTS>) {
		chomp($cutSite);
		#if it's a duplicate read;
		if ($cutSite == $previousCut) { #Sum up all reads for this spot.
			$currentCount++;
			next;						#skip to next read
		}
		#otherwise, it makes it past this loop;
		#output the sum of counts for the previous spot

		print OUT $currentCount."\n"; 
		$countIndex++;
		#reset for the current spot
		$currentCount = 1;
		#and print out all 0s between them
		while ($countIndex < $cutSite) {
			print OUT "0\n";
			$countIndex++;	
		}
		#now, 
		$previousCut = $cutSite;
	}
	#Finish chromosome
	while($countIndex <= $chr_size{$currentChromosome}) {
		print OUT "0\n";
		$countIndex++;
	}
	close(OUT);
	#`gzip $outfolder/chr$currentChromosome.wig`;
	close(CUTS);

}#end subroutine





