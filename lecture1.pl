#BIF712 Lecture #1
#Wednesday September 6, 2017

#a couple of notes:
#to verify that perl is installed and check its version type perl -v
#at the command prompt (cmd.exe in windows)

#perl history: perl was invented in 1987 by Larry Wall
#it was invented as an alternative scripting language for the unix (linux) operating systems
#some advantages of perl:
#1) perl is multi-platform
#2) perl is "open source" therefore freely available for download, modifaction, updates etc.
#3) perl has very powerful text (string) processing capabilities
#4) perl is heavily "modularized" which means that it contains special modules or packages
#	to perform specialized tasks (ex. bioinformatics related tasks - BioPerl)
#5) perl allows for high-level data structures that are easy to learn and use to store
#	and manipulate complex data (such as genomic data)
#6) perl can be written "procedurally" or using Object Oriented style (multiple style options)
#7) it is great for rapid application programming and prototyping

#this file is a perl program file (recognized by the .pl extension)
#every line that begins with a # is a comment and is ignored by the perl interpreter
#comments are meant for human eyes, they're a type of documentation
#the perl interpreter is a compiled program that reads and executes perl script

#to display information on the screen from within perl use the 'print' statement
#historically, the first computer program that a programmer writes is "hello world"
print "hello world!";
#notice every statement (instruction/command/line) in perl ends with the semicolon ';'
#exercise: use print 3 times to display 3 different messages, try reordering the messages
#special "escape characters" allow us to insert special characters in our output
#ex. \n (they all begin with the backslash '\')
print "\nthis is another message!\n";
print "this is the final message, goodbye!";

#in order to perform more complex tasks besides displaying messages
#we're going to need to represent data or information in order to work with it
#data is stored in "varaibles" - which are a little like variables in math, but
#computer programming language variables can CHANGE their value over their lifetime

#in perl we declare varaiables according to the following rules:
# 1) variable names must begin with either alphabetic or the underscore character '_'
# 2) after the first character in the name, any number of alphabetic, numbers, or '_' can be used
# 3) varaible names may not contain "special" characters such as " * / # $ % " etc.
# 4) variable names cannot be the same as perl language commands and statements (ex. print)
# 5) the names "a" and "b" have special meaning when sorting lists so avoid these names as well
# 6) the perl language is case sensitive so 'apple' 'Apple' and 'APPLE' are all different names
# 7) it's proper to use "camel case" names when combining words into a variable name
#	ex. myFavoriteSandwich professorAge - recall we're not allowed spaces in variable names

#Scalar variables only have one value associate with them (unlike vectors in linear algebra)
#scalar variables are all prefixed with the "$" symbol
#there are two types of scalars in perl: numbers and strings (text)
#example of a numerical variable
$myAge = 38;
#note '=' is the assignment operator that stores the value on the Right Hand Side (RHS) in the 
#	variable listed on the Left Hand Side (LHS)

#we can display variables by embedding them inside quoted text strings following the print statement
print "my age is $myAge \n";
#declare a varaiable to store a letter, in this case "A" is stored in the varable called "letter"
$letter = 'A';
#example of a variable that stores a string
$text = "this is a string of text";
#example of printing multiple variables at the same time
print "letter: $letter, text: $text, myAge:  $myAge\n";





