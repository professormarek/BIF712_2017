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
#if we don't care about the value that was shifted off, we can omit the "$temp =" below
$temp = shift(@array);
print "result of shift: $temp array now contains: @array\n";

#the unshift keyword adds a new element to the FRONT of the array, unlike push which adds to the end
#this will increase the array size by 1
unshift(@array, -9999);

print "result of unshift: array now contains: @array\n";


#the perl SPLICE (not to be confused with SLICE) subroutine or function removes the elements
#of an array starting from an index OFFSET and continues for LENGTH number of elements
#optionally replaces removed elements with a LIST (if provided)

#splice ARRAY
#splice ARRAY OFFSET
#splice ARRAY OFFSET LENGTH
#splice ARRAY OFFSET LENGTH LIST

#if LENGTH is omitted the splice function removes everything from OFFSET onwards

#splice returns the removed elements as a list or "undef" (empty list) 
#if there were no elements removed
#the ARRAY may grow or shrink in size depening on the LENGTH and length of LIST
#if OFFSET is negative then splice starts from the END of the array
#if both OFFSET and LENGTH are omitted, the splice removes everything!
#if OFFSET is past the end of the array and a LENGTH was provided, perl will issue a WARNING

#splice has an immediate effect on the array supplied - it will alter the array!

my @letterArray = ('a'..'z');
my @removedLetters = ();
print "letterArray is originally: @letterArray\n";

@removedLetters = splice(@letterArray, 10); #remove all elements at index 10 and after
print "removed: @removedLetters letterArray is now: @letterArray\n";

@letterArray = ('a'..'z');
#remove elements 10, 11, 12 using splice
@removedLetters = splice(@letterArray, 10, 3);
print "removed: @removedLetters letterArray is now: @letterArray\n";

@letterArray = ('a'..'z');
my @replacements = ('J', 'K', 'L');
#remove j k l and replace them with their capital letter versions using splice
@removedLetters = splice(@letterArray, 9, 3, @replacements);
print "removed: @removedLetters letterArray is now: @letterArray\n";

#I will leave replacing with a different number of elements as an exercise to you
#also an exercise: play with negative indicies 

#the perl join function concatenates the separate elements of a list into a
#single scalar string with fields separated by the indicated SEPARATOR
#syntax:
# join(SEPARATOR, @array)

$temp = join(',' , @letterArray);
print "the joined letterArray is: $temp\n";

#the split function the opposite of join; it splits a scalar string into a list or array
#syntax:
# split /PATTERN/ EXPR
# split /PATTERN/ EXPR LIMIT
#where EXPR is the string you want to split
#split will return a list that you can then assign
#any value in EXPR that matches PATTERN is taken to be a separator that "splits" the EXPR into
#substrings we call "fields" or "columns" that DO NOT include the separator
#PATTERN can be a variable (can decide at runtime)
#if LIMIT is supplied and positive, then it represents the MAXIMUM number of fields in the 
#list that will be returned (the maximum number of splits)
#split DOES NOT alter the EXPR string supplied

my $str = "the quick brown fox jumped over the lazy dog";
my @list = split(' ', $str);

print "splitting string: $str\n";

for(my $i = 0; $i < @list; $i++){
	print "$list[$i]\n";
}

#the perl foreach loop is a convenient loop to work with lists
#it automatically iterates over the entire list and sets the control varaible supplied
#each time through the loop to the current element starting with element 0 and ending with 
#element SIZE-1

#syntax:
# foreach VAR (@array){#do something with VAR}

#ex. rewriting the previous loop as a foreach loop
print "testing foreach loop:\n";
my $element;
foreach $element (@list){
	print "$element\n";
	#element takes on a new value automatically each time through the loop
}

#while we are on the topic of loops
#let's talk about "next" and "last"

#the last keyword immediately exits the loop being executed
#in case we are in a loop that's inside ANOTHER loop then we break out of the INNER loop only
#when the "last" keyword is reached, nothing else in the loop is executed
#notice that we never NEED to use "last" - it's always possible to structure the logic
#of your loop in such as way that "last" is not needed.
#professor marek's advice is to AVOID using "last" whenver possible 
my $i = 0;
while(1){
	$i++;
	print "this is time $i through the loop\n";
	if($i > 10000){
		last; #when we hit this, the loop will end
	}
}

#the "next" keyword will take us to the start of the next iteration or time though the loop
#skipping any statements remaining in the current iteration of the loop
#much like the "last" keyword it will make the logic of your loop more difficul to follow
#therefore you should AVOID it

#ex. create a loop that prints even values only.
for($i = 0; $i <= 100; $i++){
	print "print the number only if its even...\n";
	if($i % 2 != 0){next};
	print "the value is even, so print it: ";
	print "$i\n";
	
}









