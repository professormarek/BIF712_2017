#lecture 1b

#perl converts strings to numbers automatically
#notice the variable below is storing a number, and not a character or strings
#we identify characters because they're enclosed in single quotes ''
#we identify strings because they're enclosed in double quotes ""
$myVar1 = 8;
#experiment with conversion
$myVar2 = "12abc";
#let's try to use myVar2 in a math expression
$result = $myVar1 * $myVar2;
print "result is: $result\n";

#perl includes many math operators
#addition +
#subtraction -
#multiplication *
#division /
#exponentiation **
#remainder of whole division "modulus" "mod" %
$remainder = 30%7; #the remainder of 30 divided by 7
#compute 30 divided by 7 and display the result as a fractional number (one with a decimal point)
$divided = 30/7;
print "30 divided by 7 is $divided, the remainder of 30 divided by 7 is $remainder";
#henceforth we will refer to these numbers by their proper name "floating point number"

#print out the result of 3 + 7 * $remainder to verify the order of operations BEDMAS
#Brackets, Exponents, Division/Multiplication, addition/subtraction
$myVar3 = 3 + 7 * $remainder;
print "BEDMAS experiment result: $myVar3\n";
#print out 2 raised to the exponent 5 (another way to write this in "pseudocode" is 2^5)
$exp1 = 2**5;
print "2^5 is $exp1\n";
#tricky: print out -2 raised to the power of 6
#notice how we use the () brackets to change the order of operations
$exp2 = (-2)**6;
print "-2 ^ 6 is: $exp2\n";

#Topic: Logic in perl.
#recall the concepts of "true" and "false"
#The number 0; the strings "0" and ""; empty lists (); and undef all mean "false" in perl
#true values are anything that is not "false"
#negation (making a true value false or a false value true) is accomplished with the "!" or "not"
#if you try to use a false value as a string, it will be interpreted as empty string ""
#if you try to use a false value as a number, it will be interpreted as a 0
#most perl operators that return "true" or "false" behave according to the rules above

#perl Numeric Relational Operators
#less than <
#less than or equal to <=
#greater than >
#greater than or equal to >=
#equal to ==
#not equal to !=

#experiment with relational operators (note what happens when the conditions are FALSE)
#the lines below use the "if" statement which performs an action if a condition is TRUE

print "My condition was TRUE ", "\n" if(4 == 4);

#here it will print a blank line because the condition is FALSE
print "Is 2==4?", "\n" if(2 == 4);

print "Is 5 == 5? ", 5 == 5, "\n" ;
print "Is 3 < 4? ", 3 < 4, "\n" ;
print "Is 6 < 6? ", 6 < 6, "\n" ;
print "Is 7 != 5? ", 7 != 5, "\n" ;
print "Is 9 > 4? ", 9 > 4, "\n" ;
print "Is 6 <= 6? ", 6 <= 6, "\n";

#an operator that you might see "in the wild" such as stackoverflow.com is the <=>
#it returns 0 if lhs==rhs
#it returns 1 if the lhs > rhs
#it returns -1 if rhs > lhs
print "3 <=> 4 ? ", 3 <=> 4, "\n";
print "6 <=> 6 ? ", 6 <=> 6, "\n";
print "7 <=> 5 ? ", 7 <=> 5, "\n";

#more complex logical expressions
#we can combine more than one logical expression by using operators "&&" to mean AND "||" to mean OR
#we can also use the negation or NOT operator "!"
#more experiments
$pi = 3.14159;
$avogadro = 6.02*10**23; #6.02 x 10^23
print "3 < 4 && 9 >= 9 ? ", 3 < 4 && 9 > 9, "\n";
print "pi > 4 || avogadro != 0 ? ", $pi > 4 || $avogadro != 0, "\n";
print "pi > 4 && avogadro != 0 ? ", $pi > 4 && $avogadro != 0, "\n";
print "pi > 4 || 6 < 7 && pi == 3 ? ", $pi > 4 || 6 < 7 && $pi == 3, "\n";
#negation or NOT operator
print "!pi ? ", !$pi, "\n";
print "!0 ? ", !0, "\n";
print "!(9 < 7) ? ", !(9 < 7), "\n";

#how to accept user input in perl
#the standard input stream <STDIN> can be used to capture input data from:
#keyboard, file, network, etc. and store the value in a variable

#procedure to get the user to enter data using the keyboard
#1)"prompt the user" by writing them a nice message asking for input
#2) read in the user's response and store it in a variable 

#example:
print "Please enter a numeric value: ";
$number = <STDIN>;
#verify the user's input
print "The user entered: $number";

#exercise: ask the user to enter the radius of a circle, and compute and display the area of that circle

