#!/usr/bin/perl

use strict;
use warnings;

#perl subroutines are a way to re-use commonly used code amongst your programs
#a subroutine is a module or chunk of code that does a self-contained task
#you may also hear of subroutnes called "functions" which basically means the same thing

#perl subrutines are defined by the programmer anywhere in the main program
#or loaded from other source files as needed by using the "do", "require", or "use" keywords

#subroutines have a notion of "parameters" or "arguments" which are information
#passed to the subroutine for it to do its job.

#subroutines also have a notion of "return value" which like a math function
#provides a result back to the caller

#as an implementation note, perl "flattens" arguments into lists or arrays that are 
#passed to subroutines.

#to define a subroutine use the "sub" keyword followed by the name you wish to give
#your function, followed by an opening curly brace "{" then the code that you want the
#function to execute, followed by a closing brace "}"

#optionally, if your function accepts arguments put one $ for each argument
# between ( ) round braces following the funciton name

#ex. factorial functions
#note: subroutines can implement mathematical functions but they don't *have* to
#as a general rule, declare your subroutines before they are used in code (ie. seen by the interpreter)
#there *are* ways to forward-declare subroutines using prototypes but we'll cover this next class...

sub factorial ($) {
	my ($n) = @_; #@_ is a default array (like @ARGV) but @_ holds the argument(s) to our subroutine
	my $result=1;
	for(  ; $n > 0; $n--){
		$result = $result * $n;
	}
	#the return keyword tells perl what value(s) to provide back to the caller
	return $result;
}



#use the factorial subroutine:
my $threeFactorial = factorial(3); #could also pass a variable as an argument
print "3! is: $threeFactorial\n";

print "please enter a number to compute the factorial of that number: ";
my $userN = <STDIN> ;
chomp($userN);
my $userFactorial = factorial($userN);
print "the factorial of $userN is $userFactorial\n";
