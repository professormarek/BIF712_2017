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

#the number of elements in an array may also be determined by using the 
#following methods:
# scalar(@array) would return a value of 5
# $#array would return the index of the last element in the array: 4

print "total number of elments in the array: ", scalar(@data), "\n";
print "the last valid index (last element) is: $#data \n";

print "printing all elements of our array: @data\n";

#supplying a negative index between the [] square braces access
#to the array begins at the end (last element) starting at -1
print "the last element is: $data[-1]\n";
print "the second last element is: $data[-2]\n";

#Sequential number arrays
#perl has a shortcut for initializing arrays with sequential numbers 
#and letters 
#rather than typing out each element when initializing many numerical
#values you can use the range ".." operator as follows

my @numericalList = (1..100);
my @lowercaseLetters = ('a'..'z');

print "numericalList: @numericalList\n";
print "lowercaseLetters: @lowercaseLetters\n";

#to remove the last element of the array we can use the pop keyword
# pop (@array)

#ex.
pop(@data); #this will remove the last element: 31
print "our data array after popping the last element: @data\n";

#to add things to an array after it has been initialized
# push (@array , list of things to add)

#ex.
push(@data, 452);
print "our new data array after pushing 452: @data\n";

#we can empty out an array with the following syntax:
@data = ();
print "our emptied out data array: @data\n";

#easy way to reverse the contents of an array 
# reverse (@array);
#the above command returns a reversed array - doesn't alter the array
#try assigning the reversed array to itself before printing

my @reversed = reverse(@lowercaseLetters);
print ("reversed lowercaseLetters: @lowercaseLetters \n");
#alternatively, if you want @lowercaseLetters to be permanently changed
#you can re-assign it to itself

#sorting
#perl has built in sorting by using the "sort" keyword
#it sorts the array "lexically" or alphabetically
#much like the reverse keyword, it doesn't alter the original array
#instead it returns a sorted array which we can then assign
my @months = ("january", "april", "may", "june", "october");
my @sortedMonths = sort(@months);

print "original: @months \nsorted: @sortedMonths\n";

#notice that numerical lists will also be sorted alphabetically by default :-(
#to force perl to sort a numerical list numerically
my @unsortedNumbers = (7, 99, 3, 1, 2001, 101);
my @sortedNumbers = sort {$a <=> $b} @unsortedNumbers;
print "original: @unsortedNumbers \nsorted numerically: @sortedNumbers\n";

#we can access more than one element of an array at one time
#by using so-called LIST SLICES
#slices are created by specifying a comma separated list of values
#enclosed in [] square brackets
#for example to display slices of the months array
print "first third and fifth elements of @months[0,2,4]\n";
#we can also use the range operator with SLICES
print "slices of lowercaseLetters @lowercaseLetters[10..16]\n";























