#!/usr/bin/perl

=head

this script is used to find normalized .bedGraph file
as if there are 10M mappable reads, with each = 50bp

=cut

if ($#ARGV ne 1) { 
  print "command line: perl norm_bedGraph.pl file.bedGraph file.norm.bedGraph\n";
  exit;
}

$raw_read_length = 50;
$infile = $ARGV[0];
$outfile = $ARGV[1];

open (in, "<$infile");
while ($line=<in>) {
  if (!($line=~/track/)) {
    chomp $line;
    @data = split /[\s+\t+]/, $line;
    $sum = $sum + $data[3]*($data[2]-$data[1]);
  }
}
close in;
$sum = abs($sum);

open (in, "<$infile");
open (out, ">$outfile");
while ($line=<in>) {

  $count++;
  if ($count%10000 eq 0) {
    print $line;
  }

  if (!($line=~/track/)) {
    chomp $line;
    @data = split /[\s+\t+]/, $line;
    $value = $data[3]/($sum/$raw_read_length)*10000000;
    print out "$data[0]\t$data[1]\t$data[2]\t$value\n";
  }
}
close in;
close out;
