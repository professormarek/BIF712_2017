use strict;
use warnings;

# Displaying formatted output with printf(...):
# To display a 10 column field which includes data:

my $i;
for($i=1; $i<1000; $i+=60) {
   printf("%10d\n", $i);
}

#in printf formatting strings, we can use several types of placeholder
# %d for whole (integer) numbers
# %f for floating point numbers
#preceeding these with a number, will specify the column width
#in the case of floating point numbers, we can add .X where X is a number of decimal places to show


my $x = 5.33333333333333333333;
my $text = "welcome back to perl class";

#we can have multiple placeholders and values displayed
printf("HERE IS MY DATA: %d | %f | %s \n", $i, $x, $text);


#remove the separators
#print i with column width of 8
#print x showing 9 decimal places
#print text as usual
printf("HERE IS MY DATA: %8d  %.9f  %s \n", $i, $x, $text);

printf("HERE IS MY DATA: %8d  %10.4f  %s \n", $i, $x, $text);

