#to be able to make a decision in code and "Branch" the execution of our code
#depending on some circumstances and logic we use the "if" statement
#syntax for if statement is:
#if (<condition>) {statment}
#the statement will be executed only if the condition is true
#there can be one or more statements within the {} sparated by ; as with regular statments
#notice that if the condition evaluates to false, the statements within the {} curly braces
#will NOT be executed
#the "else" statement is used to execute statements if the condition is FALSE

my $mark;
print "enter your mark out of 100: ";
$mark = <STDIN>;
chomp($mark);

if($mark >= 50){
	#statements in here will only be executed if the condition above is TRUE
	print "hooray, you passed!\n";
}else{
	#statements in here will only be executed if all conditions above are FALSE
	print "you failed!\n";
}

#the "elsif" statement is short for "else if", which is a way to check another condtion
#as part of the same logical flow in the if statment
print "enter today's weather (SUNNY or CLOUDY or RAINY): ";
$input = <STDIN>;
chomp($input);
#note, we can use the "uc" subroutine to return an uppercase version of a string
# (also "lc" will return a lowercase string if that's what you want)
$weather = uc($input);
print "original input was $input, and the uppercase string is $weather\n";

if($weather eq "SUNNY"){
	print "hooray it's sunny out today. let's enjoy the last breath of summer\n";
}elsif($weather eq "CLOUDY"){
	print "blah, whatever\n";
}elsif($weather eq "RAINY"){
	print "bring an umbrella\n";
}else{
	print "you did not enter one of the options!\n"
}

#we can combine logical conditions by using the && AND operator and || OR operator
if($weather eq "SUNNY" && $mark > 90){
	print "today will be a very good day, indeed\n";
}

print "program complete!\n";
