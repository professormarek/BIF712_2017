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

#the do-while loop is similar to the while loop, except it tests the condition at the END
#rather than BEFORE entering the statements within the {} for the first time
#therefore, it will execute the statements within {} at least ONCE
$i =0; #try this with $i=10 or 100 
print "entering the do-while loop\n";
do{
	print "i is now: $i\n";
	$i++;
} while($i < 10);

#you might notice that loops have certain features in common.
# A) there is a varaible used in the condition, and it is initialized before we reach the loop
# B) there is a condition that is checked to decide whether to repeat the statements inside the {}
# C) there are statements executed inside the loop (useful stuff)
# D) there is a statement that updates the variable used in parts A and B such that the condition
# eventually becomes FALSE
$i =0; #A
while($i < 10){ #B
	print "(while loop)i is now: $i\n";#C
	$i++;#D
}

#the "for" loop also repeats statements within the {}
#however, it uses a concise "cookie cutter" approach that reminds the programmer of parts A-D
#and makes it less likely that we'll accidentally introduce errors such as an infinte loop
#the syntax is like this:
#for(A ; B ; D){
#	C
#}
#initialization (A) happens the first time we reach the for statement
#note that in the for loop the condition is checked before entering the body (C) for the first time
#the update (D) happens after the } is reached, but before the condition is checked again

#on the flip side, the while loop lets the programmer be more creative - reorder or completely omit
#parts of the loop if we're using while (do-while)

print "entering a for loop (eqivalent to the while loop just before):\n";
for($i=0 ; $i<10; $i++){
	print "(for loop) i is $i\n";
}

#the "until" loop repeats a group of statements until a given condition becomes TRUE
#note, that like the while loop, it checks the condition before executing the statements inside {}

$i = 0;
print "entring until loop\n";

until($i >= 10){
	print "(until loop) i is $i\n";
	$i++;
}

#there's also the do-until loop that executes the statements within {} at least once
#much like the do-while loop (left as an exercise to the reader)

#STYLE MATTERS: whenever you write code within {} curly braces, indent all those lines until the
#closing curly brace } 


#changing gears a bit.. 
#perl has built in subroutines for generating "pseudo-random numbers"
#random numbers are useful for so-called Monte Carlo simulations or analysis.
#... for now though let's use them for a guessing game

#the rand() funciton or subroutine by default generates a number (fraction) between 0 and 1
# however an argument can be supplied to return a decimal between 0 and that number
#examples:
my $randomNum = rand(); #note: uniform distribution between 0 and 1
print "my random number is: $randomNum\n";
#let's see a number between 0 and 100
my $limit = 100;
$randomNum = rand($limit);
print "my random number (0-100) is: $randomNum\n";
#to drop off (truncate) any decimal places we can use the int() function or subroutine
$randomNum = int($randomNum);
print "my random number truncated (0-100) is: $randomNum\n";

#A perl guessing game
my $range = 10;
#choose a number for the player to guess
my $targetNumber = int(rand($range));
my $countOfGuesses = 0;
my $maximumGuesses = 3;
my $userGuess;
print "*************************\n";
print "*WELCOME TO GUESSNG GAME*\n";
print "*************************\n";

do{
	print "Enter a number between 0 and $range\n";
	chomp($userGuess = <STDIN>);
	$countOfGuesses++;
	if($userGuess == $targetNumber){
		print "Hooray! YOU WON!!!!!!!\n";
	}else{
		print "Your guess wasn't correct!\n";
		if($countOfGuesses < $maximumGuesses){
			print "Guess again!\n";
		}
	}
	#exercise: tell the user how many guesses the have left

}while($countOfGuesses < $maximumGuesses && $userGuess != $targetNumber);

if($userGuess != $targetNumber){
	print "sorry! you ran out of guesses, play again!\n";
}




#exercise1: count down from 10 to 0 (using a loop)
#exercise2: prompt and accept a number from the user
# count up from 1 to the number the user entered



print "program complete!\n";








