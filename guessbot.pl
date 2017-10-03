#!/usr/bin/perl
#the line above tells the operating system where to find a program to interpret (execute) this script




#change this into a guessing game
#make the number to guess between 1-10000 (choose once)
#BUT the computer plays itself 
#it keeps guessing until it's right, then end the program
#and sleeps 1 second between guesses
#make sure you use print to display what is going on


#first generate a number to guess and store it as a variable

#create a loop that will keep guessing until the guess is right
#A perl guessing game
my $range = 10000;
#choose a number for the player to guess
my $targetNumber = int(rand($range));
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

