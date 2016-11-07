#!/usr/bin/perl

my $bam_out = shift;
chomp($bam_out);

unless(-f $bam_out){
    print STDERR "\nBAM file doesn't exist: $bam_out\n";
    exit;
}

print STDERR "\nCreating bed file\n";
my $bed_out = $bam_out;
$bed_out =~ s/\.bam$/\.bed/g;
open(OUT,">$bed_out");
open(PH, "samtools view -h $bam_out |");
while(<PH>){
    chomp;
    unless($_ =~ /^\@/){
        my @line = split /\t/;
        if($line[1] == 99 || $line[1] == 163){
            # score 99 (first good mate pair alignment on pos strand, mate has score 147)
		my $start=$line[3];
		my $end=$start+abs($line[8]); # fragment length should be considering the read lenght of R2.
		$start_extl = $start + 4 - 25;
  		$start_extr = $start + 4 + 25;
  		$end_extl = $end - 5 - 25;
  		$end_extr = $end - 5 + 25;
		if ($start_extl < 0) { $start_extl = 0;  }
  		if ($end_extl < 0) { $end_extl = 0; }
		if($line[1] ==99){
  			print OUT join("\t",($line[2],$start_extl,$start_extr,$line[0],$line[8],"+")),"\n";
 			print OUT join("\t",($line[2],$end_extl,$end_extr,$line[0],$line[8],"+")),"\n";
			}

            # score 83 (first good mate pair alignment on neg strand, mate has score 163)
		if($line[1]==163)
		{	
  			print OUT join("\t",($line[2],$start_extl,$start_extr,$line[0],$line[8],"-")),"\n";
 			print OUT join("\t",($line[2],$end_extl,$end_extr,$line[0],$line[8],"-")),"\n";
			
		}
#            print OUT "$line[2]\t$line[3]\t" . ($line[3]+abs($line[8])) . "\t$line[0]\t" . abs($line[8]) . "\t+\n" if $line[1] == 99;
#            print OUT "$line[2]\t$line[3]\t" . ($line[3]+abs($line[8])) . "\t$line[0]\t" . abs($line[8]) . "\t-\n" if $line[1] == 163;
        }
    }
}close PH;close OUT;
