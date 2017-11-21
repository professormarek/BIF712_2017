use strict;
use warnings;

my $ifile = "data.txt";
my $ofile = "data.copy.txt";

#notice that the $! default variable stores an error
open(IN, $ifile) || die("Error opening file: $ifile... Message: $!\n");
open(OUT, "> $ofile") ||
   warn("Error opening file: $ofile... (must be a permission issue) $!\n");

my $line;
#this loop will read one line at a time out of the IN file handle
#much like we did with 
while($line = <IN>) {
   print "$line";
   print OUT $line; # printing to the file
}

close(OUT) || die "Could not close output file '$ofile' properly... $!";
close(IN) || die "Could not close input  file '$ifile' properly... $!";
