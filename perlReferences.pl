# BIF712 Lecture #8
# Thursday November 3, 2016

# To check version of Perl installed on your system: Perl -v
# This semester (Fall 2016) we will be using Perl version 5.24.0

use strict;
use warnings;


# Perl References and complex data structures:
# A reference in Perl is a scalar value that stores the memory location of
# another variable, or an anonymous scalar, array, or hash.
# References are created by preceeding the name of an existing variable or anonymous
# structure with the backslash \ operator.

# Syntax:
# Creating references to an array, hash, or scalar:
# If you put a \ in front of a variable, you get a reference to that variable.
my ($arrayRef, $hashRef, $scalarRef);
my @numList = (1..10);
my %romanNums = (i=>"1", ii=>"2", iii=>"3", iv=>"4", v=>"5", vi=>"6", vii=>"7", viii=>"8", ix=>"9", x=>"10");
my $numStr = "one:two:three:four:five:six:seven:eight:nine:ten";

$arrayRef  = \@numList;       # $arrayRef now holds a reference to @numList
$hashRef   = \%romanNums;     # $hashref now holds a reference to %romanNums
$scalarRef = \$numStr;        # $scalarRef now holds a reference to $numStr

# Once the reference is stored in a variable like $arrayRef or $hashRef, you can copy it or
# store it just the same as any other scalar value:
my $newRef;
$newRef = $scalarRef;         # $newRef also now holds a reference to $numStr

print "\$newRef is: $newRef\n";    # does not display the value in $numStr but
				   # instead shows the TYPE of reference that $newRef holds
print "\$arrayRef: $arrayRef\n\$hashRef: $hashRef\n\$scalarRef: $scalarRef\n";


print "\$newRef is: $$newRef\n";   # proper derefence of $numStr

# To dereference an entire array or entire hash, a special notation is required.
# The array or hash reference must be enclosed with { } and preceeded with the
# data structure's correct symbol.

print "the entire list is: @{$arrayRef}\n";
@{$arrayRef}[2]++;      # version 1 (dereferencing an array) using { }[ ] brace and index notation
			# element at index 2 (value of 3), now incremented to 4
print "@{$arrayRef}\n";

$arrayRef->[2] = 9999;  # version 2 (dereferencing an array) using arrow notation
			# element at index 2 (value of 4), now assigned a new value of 9999
print "@{$arrayRef}\n";
print "@numList\n";

# However, the real value in learning and using references is
# as a mechanism to maintain the integrity of data that is
# sent to your own subroutines!

sub process;

my @cities = ("Toronto", "New York", "Montreal", "Vancouver", "Beijing",  "Tokyo");
my @countries = qw/Canada USA Canada Canada China Japan/;

my ($cityRef, $countryRef);
$cityRef = \@cities;
$countryRef = \@countries;

print "address of \@cities: $cityRef address of \@countries: $countryRef\n";

process(\@cities, \@countries); # send each list as a reference parameter to subroutine

# A two-dimensional array in Perl
my @twoDimArray = ( ["zero-zero", "zero-one", "zero-two"],
		    ["one-zero",  "one-one",  "one-two"],
		    ["two-zero",  "two-one",  "two-two"]
		  );

print "@twoDimArray\n"; # displays the addresses of each row ONLY

foreach $arrayRef (@twoDimArray) { # assigns each array address to a reference
   print "@{$arrayRef}\n";         # displays the array through the reference
}

print "element [1][1] of twoDimArray is: $twoDimArray[1][1]\n";

sub process {
   my ($rlist1, $rlist2);
   $rlist1 = shift(@_);  # $rlist1 is now a reference to the @cities array in main
   $rlist2 = shift(@_);  # $rlist2 is now a reference to the @countries array in main

   print "cities: @{$rlist1}\n";
   print "countries: @{$rlist2}\n";
   print "entire stack: @_\n";
}
