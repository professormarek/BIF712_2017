#perl lists - also known as Arrays
#in the pel language an array is a variable that stores an ordered list
#of (usually) scalar values. Array variables are created by preceding 
#the varaiable name with the "at" symbol '@'
#a list variable can be initialized by assigning (recall '=' assignment op)
#a comma separated list of scalar values enclosed in parentheses( ).
#lists can contain any combination of scalar values including numeric, string
#character literals etc.
#values stored in lists are accessed (sequentially) by index starting
#at index 0 - the first element. Indices continue until the size of the
#array - 1.
#So for an array of size N elements, the first element is stored at 0
#and the last element is stored at index N-1
#Each individual element in the array is a scalar value; it is therefore
#accessed by using the scalar symbol $ with the array variable's name followed
#by the index of the element within [] square braces
#when the @ sign is used in front of the array varaible name it's 
#evaluated to be the array's size.

use strict;
use warnings;

#ex.
my @data = ("coffee", "subway", 3.14159, "someone is hungry", 31);
#declare a counter variable for our loop
my $i;
#ex. use a loop to visit every element in the array and print it out
for($i=0; $i < @data; $i++){
	print "in the data array the value at index $i is $data[$i]\n";
}

#we can access individual elements outside of a loop as well
#using literals or the size of the array - 1
print "the first element of data is: $data[0] and the last element is $data[@data - 1]\n";






