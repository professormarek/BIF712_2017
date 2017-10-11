#couple more notes on perl subroutines and passing multiple arguments to them
use strict;
use warnings;

#we can "pre-declare" subroutine protypes by using the following syntax
sub sumOfSquares($$); #there are two $'s because we're expecting two arguments here
#this will allow us to define the actual subroutine below, after we use it in code...
#please notice that when you try to pass an array or hash to a subroutine
#perl will by default "flatten" those arguments into an array
#my advice is until we learn about "references" in perl, avoid passing arrays or hashes
#to subroutines

print "sum of the squares 5 and 7 is: ", sumOfSquares(5,7), "\n";
print "sum of the squares 3 and 6 is: ", sumOfSquares(3,6), "\n";

#define the sumOfSquares subroutine below...
sub sumOfSquares($$){
        #when we have multiple arguments passed to a subroutine we can use the
        #shift command which by default will operate on the @_ default array variable
        print "DEBUG: arguments are: @_ \n";
        my $argument1 = shift; #this implictly does shift(@_)
        my $argument2 = shift;
        print "DEBUG: argument1 is $argument1, argument2 is $argument2 \n";
        #compute the sum of squares
        return($argument1**2 + $argument2**2);
}
