use strict;
use warnings;
#in cases when you want to perform some action if a condition is FALSE
#you have at least two options:
#1) one is to use the "not" operator (shorthand for not is "!")
#2) the second way is to use "unless" instead of "if"

#let's do the grade example in terms of a negative condition
my $grade1 = 90;
my $grade2 = 40;

#doesn't print because $grade1 >= 50 evaluates to TRUE and then the not operator negates to FALSE
if(not($grade1 >= 50)){
	print "the first student failed\n";
}

#now try the same thing with grade2
if(not($grade2 >= 50)){
	print "the second student failed\n";
}

#demonstrating "!" is the not operator
if(!($grade2 >= 50)){
	print "the second student failed\n";
}

#we can represent the same idea using unless
unless($grade2 >= 50){
	print "the second student failed\n";
}

#there are some common operators that are shorthand for representing often-used operations in programming
#there are decrement by one "--" 
#and increment by one is "++"

#when used "postfix", that is, following a variable the rule is that it will evaluate first, 
#	then increment the variable
#when used "prefix", that is just before a variable the rule is that it will change the value first,
#   then evaluate the expression

my $num = 7;
my $result;
$num++; #this is the same as saying $num = $num+1
print "num is : $num\n";

$result = $num++; #the assignment to $result happens first, THEN $num is incremented (postfix)
print "ex: postfix result is $result and num is $num\n";

#now let's see the difference with prefix
$result = ++$num;
print "ex: prefix result is $result and num is $num\n";

#much like ++ and -- increment or decrement by one there's a shorthand operators
#for incrementing or decrementing by any amount
# += for incrementing and -= for decrementing
my $sum = 100;
$sum -= 20; #longhand: $sum = $sum - 20
print "sum is $sum\n";
#other shorthand operators exist like the above ex. *= for multiplying, /= for dividing.. and more

#shorthand for string operations, appending (concatenating) to the end of a string using .=
my $seq = "ATCG";
$seq .= "-UAGC"; #longhand this would be $seq = $seq . "-UAGC"
print "sequence is now $seq\n";

#without further adieu let's talk about repeating statements using LOOPS (also called iteration)

#a loop statement allows the progrmamer to execute a statement or a block (or group) of statements
#repeatedly until a condition directs it to stop

#perl has several kinds of loop that we will demonstrate below

#the "while" loop repeats a statement (group of statements) as long as the condition is TRUE
#syntax:
# while(<test condition>){
#	statement(s)
#}
#it's implict here that the condition eventually has to become FALSE or else we have a non-terminating
#loop referred to as an "infinite loop"

#to make this an infinite loop change 0 to 1 (true)
while(0){
	print "welcome to infinite loop\n";
}

#let's write a loop that will count from 0 to (some number)
print "counting from 0 to 9\n";
my $i = 0; #much like math convention is to use x, y, z for variable names, programmers use 
#i, j, k etc. for loop condition variables
while($i < 10){
	#remember this group of statements within the {} will get repeated as long as the condition above is true
	print "i is now: $i\n";
	$i++;
	#this is the end of the statements inside the {}, next execution will jump back up to the 
	#while statement and check the condition AGAIN
}

#exercise1: count down from 10 to 0 (using a loop)
#exercise2: prompt and accept a number from the user count up from 1 to the number the user entered



print "program complete!\n";








