#some additional array topics
#in addition to push and pop there are other important array functions
use strict;
use warnings;

#exercise: write a short program that will ask the user to enter numbers
#until the user pressed enter without entering any data
#use push() that we learned yesterday to add elements to the end of the array

my $input;
my @array = ();
my $temp;
do{
	print "enter a number: ";
	$input = <STDIN>;
	chomp($input);
	if($input){
		push(@array, $input);
	}
	#print "DEBUG: @array\n";
}while($input);

#display the array
print "Array contains: @array\n";

#the shift keyword shifts the first value off of the array and returns
#it, shortening the array by 1 and shuffling all the data down by one index
#it's like pop but affects the FIRST element rather than the LAST element
$temp = shift(@array);
print "result of shift: $temp array now contains: @array\n";

#the unshift keyword adds a new element to the FRONT of the array, unlike push which adds to the end
#this will increase the array size by 1
unshift(@array, -9999);
print "result of unshift: array now contains: @array\n";










