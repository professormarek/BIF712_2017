#this program asks the user to enter a radius, and computes the area of the associated circle
use strict;
use warnings;

my $pi = 3.14159;
my $radius;

print "please enter a circle radius: ";
$radius = <STDIN>;

chomp($radius);

my $area = $pi * $radius**2;

print "a circle with radius $radius has area: $area\n";
