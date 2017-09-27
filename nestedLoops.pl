#nested loops example

use strict;
use warnings;

print "enter a number of rows: ";
my $input = <STDIN>;

#print a triangle shaped pattern of stars with rows and columns equal to the number entered
my ($i, $j);

for($i = 0; $i < $input; $i++){
	#each time through the above loop, we want to repeat printing out the stars in that row
	#use another loop to print each star
	#exercise: print every second star as an "x" instead (use an if statement)
	for($j = 0; $j <= $i; $j++){
		print "*";
	}
	print "\n";

} 
