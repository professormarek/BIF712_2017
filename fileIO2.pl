# Reading the contents of an entire file into memory in one operation (file slurping).
use warnings;
use strict;

my $inFile  = shift(@ARGV); # command line argument #1
my $outFile = shift(@ARGV); # command line argument #2

my ($fileData, $len);

open(IN,  "$inFile")    || die("Error: Could not open INPUT  file... '$inFile'  $!\n");
open(OUT, ">> $outFile") || die("Error: Could not open OUTPUT file... '$outFile' $!\n");

#the record separating character is how perl recognizes the end of one
#data record or row

$/ = undef;                 # setting the default record separator to undefined
$fileData = <IN>;           # slurping entire raw file into a scalar
close(IN);
$/ = "\n";                  # resetting default record separator
$len = length($fileData);   # determining the total number of bytes in the file

print "FILE DATA: '$fileData'\n";

#dump fileData to the OUT file
#and close the OUT file
print OUT $fileData;
close(OUT);

#let's display the new size of $fileData
my $fileSize = -s $outFile;
print "The new size of $outFile is: ", $fileSize;


