use strict;
use warnings;
#sometimes newlines and other characters are appended when you get input from <STDIN>
#or other sources.
#the "chomp" function or keyword removes trailing characters from the end of a string
#by default it removes new lines "\n" from the end of strings, but it can be used in other
#ways as well. note: chomp will permanently alter the string that you supply example:
print "please enter some text and press <enter>: ";
my $userInput = <STDIN>;
my $copy = $userInput;
print "the user's input is ***$userInput***";
#notice the newline from the user pressing <enter> is included in the variable $userInput
chomp($userInput);
print "AFTER CHOMP the user's input is ***$userInput***\n";
#we can print out addition information about variables and what is going on by printing out additional information
#during development that the end user doesn't need to see. when you're done, comment the lines out.
print "are the two strings equal?", $copy eq $userInput, "\n";

#the index subroutine (funciton) does is search one string for an occurence of another string!
#syntax: 
#index (string, substring)
#the version below will start at a certain position in the string being searched
#if position is omitted, it will start searching from the first character
#index (string, substring, starting_position)
#if the substring is not found within the string being searched, index will provide an answer of -1

#notice: perl and most computing environments number things starting at 0

#new syntax - we can declare more than one variable using my in the following way:
my ($needle, $haystack, $returnValue); #declare all three variables
$needle = "cd";
$haystack = "abcdefghijklmnopqrstuvwxyz";
$returnValue = index($haystack, $needle);
print "looking for $needle in $haystack position location: $returnValue\n";

#find "xv" within haystack
$needle = "xv";
$haystack = "abcdefghijklmnopqrstuvwxyz";
$returnValue = index($haystack, $needle);
print "looking for $needle in $haystack position location: $returnValue\n";
#find "gh" starting at position 4
$needle = "gh";
$haystack = "abcdefghijklmnopqrstuvwxyz";
$returnValue = index($haystack, $needle, 4);
print "looking for $needle in $haystack position location: $returnValue\n";
#find "cd" starting at position 8
$needle = "cd";
$haystack = "abcdefghijklmnopqrstuvwxyz";
$returnValue = index($haystack, $needle, 8);
print "looking for $needle in $haystack position location: $returnValue\n";
#Exercise:
#let the user enter a needle to look for, a haystack to look through, and a starting position
#search the string
#display the answer

#there is also a subroutine called "rindex" that searches right to left - try it for yourself

#the substr subroutine can regrieve or alter a portion of a string
#like crispr for strings in perl
#the simplest sytnax is:
#substr (expression, offset)
#the substr subroutine will create a copy a substring out of the original string (expression)
#and returns it.

#examples:
my $testString = "I will not eat GREEN EGGS AND HAM, I will not eat them SAM I AM!";

my $substring = substr($testString, 10); #note that this version goes from offset to the end
print "extracted text using offset 10 $substring\n";

#substr (expression, offset, length)
#the above version extracts length number of characters

$substring = substr ($testString, 10, 13);
print "extracted text using offset 10, length 13 -->$substring<--\n";

#substr (expression, offset, length, replacement)
#the version above "splices" the expression string and inserts replacement
#note that like chomp, this version of substr will modify the original string
#Exercise:
#use your new power to replace GREEN with RED in $testString
#print out the modified string
#don't forget to chomp all user input!


#to determine the length of a string we can use the built in length subroutine
#example:
my $stringLength;
$stringLength = length($testString);
print "the length of $testString is $stringLength\n";

#the next topic is "pretty" important

#next we will learn about "pretty printing" with printf
#the f in printf stands for formatted
#printf(format, list)
#format is a string with "static" characters in it, that include placeholders for variables
#and values that you want to display
#list is the list of variables that corresponds to the placeholders in the format string

my $pi = 3.141592653;
print("pi with the default number of decimal places is: $pi\n");
printf("pi to 3 decimal places is: %.3f \n", $pi); #%.3f is the placeholder for pi

#the possible formatting specifiers for variable placeholders are 
#	%f placeholder for a floating point number
#	%.#f where # is replaced with the number of decimal places you want to see
#	%c placeholder for a character with the specified ascii code
#	%s for a string variable
#	%d a signed integer
#	%u an unsigned integer
#	%x an unsigned integer in hexadecimal
#	%e display a floating point number using scientific notation
#	%b display an integer in binary

#there are more, but I would suggest looking them up for yourself when "pretty printing"

#examples
my $int;
print "please enter a number: ";
$int = <STDIN>;
chomp($int);
printf ("$int in decimal is: %d\n", $int);
printf ("$int in hexadecimal is: %x\n", $int);
printf ("$int in binary is: %b\n", $int);

#the next topic is equally or more important
#basic logic in perl enables us to take "branches" in code.























