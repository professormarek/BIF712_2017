#!/usr/bin/perl

use strict;
use warnings;
#command line arguments, as the name suggests, are pieces of information
#entered at the terminal prompt and are passed to the program to alter
#the behaviour of the program (sometimes these are called switches)

#perl automatically provides an array or list called @ARGV
#that contains the command line arguments entered when the perl
#program was started. you don't have to declare this array, even if you use strict
#this variable always exists and the values from the command line are automatically
#placed in this variable without programmer intervention

#if there were no command line arguments entered when the program was run
#this array will be empty

#in the @ARGV array $ARGV[0] contains the first argument
# $ARGV[1] contains the second argument and so forth
#to determine how many arguments there are, use the standard ways of checking array size
# ex. $#ARGV will return the index of the last element
#or use scalar(@ARGV)
my $numLineArgs =  scalar(@ARGV);

#uncomment the lines below to see how to inspect the command line arguments
#print "the number of command line arguments entered was: $numLineArgs and the arguments are: @ARGV\n";
#print "the 4th element is : $ARGV[3]\n";

#loop through the arguments and determine whether -v is one of them
#we will take -v to indicate "Verbose Output" meaning we'll display the secret number
#to the user...
my $verbose = 0; #verbose is FALSE by default
my $arg;
foreach $arg(@ARGV){
	if($arg eq "-v"){
		#print "the user entered -v !\n";
		$verbose = 1;
	}
}

#the exit command terminates the program immediately when run
#sometimes it's useful during development

#exit;




#first generate a number to guess and store it as a variable

#create a loop that will keep guessing until the guess is right
#A perl guessing game
my $range = 10000;
#choose a number for the player to guess
my $targetNumber = int(rand($range));

#if verbose output is chosen by the user, output the number chosen
if($verbose){
	print "(we're not telling guessbot, but the number to guess is: $targetNumber)\n";
}

my $countOfGuesses = 0;
my $userGuess;
print "*************************\n";
print "*WELCOME TO GUESSNG GAME*\n";
print "*************************\n";

do{
	$userGuess = int(rand($range));
	$countOfGuesses++;
	if($userGuess == $targetNumber){
		print "Hooray! YOU WON!!!!!!!\n";
	}else{
		print "Guessing: $userGuess Number of guesses: $countOfGuesses\n";
		sleep 1;
	}

}while ($userGuess != $targetNumber);

