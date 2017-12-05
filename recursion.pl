# Recursion in Perl:
# From wikipedia: https://en.wikipedia.org/wiki/Recursion
# Recursion is the process of repeating items in a self-similar way. For instance,
# when the surfaces of two mirrors are exactly parallel with each other, the nested
# images that occur are a form of infinite recursion. The term has a variety of
# meanings specific to a variety of disciplines ranging from linguistics to logic.
# The most common application of recursion is in mathematics and computer science,
# in which it refers to a method of defining functions in which the function being
# defined is applied within its own definition. Specifically, this defines an infinite
# number of instances (function values), using a finite expression that for some
# instances may refer to other instances, but in such a way that no loop or infinite
# chain of references can occur. The term is also used more generally to describe
# a process of repeating objects in a self-similar way.

# The Four Steps of Recursion
# The first step in any recursion subroutine is to handle the base cases.
# These are the cases of the simplest problems. If the input set has zero or
# one element, figuring out what the subroutine has to do is often straight forward.
# The challenging aspect, if there is one, happens when a complex data structure must
# be returned.
# At this stage, what the data structure is may not be clear and its implementation
# must wait until later, after the rest of the subroutine is written.

# The second step is to break the problem set down into smaller subsets. The simplest way
# to do this is to reduce the problem by one. Just remove and save one element from the
# given set.
# Another technique is to divide the given set into two (or more) equal or nearly
# equal subsets. There are several things to watch out for. The first is to ensure that
# every element gets placed in one subset. If not, the element will be dropped and the
# results inaccurate. The second is to ensure that each element gets placed in only one
# subset. If not, it is duplicated and, again, the results will be inaccurate.
# Another way is to ensure no subset gets all the elements. This often happens
# when there are only two elements, both get placed in one subset and none in the other;
# thus creating an infinite loop. The fourth is to ensure that all subsets have at
# least one element. If not, the subroutine is wasting time and if the results for an
# empty set is not null, the results will be inaccurate. The fifth is to ensure that
# no extra null elements are added. This will waste time and often produces
# inaccurate results.

# The third step is to call the same subroutine for each of the subsets and store
# the partial results.

# The final step is to merge the saved element with the partial results or to merge all
# of the partial results.
#
# At first, recursion seems to be magic. Break the problem into smaller tasks, call the
# same subroutine to process those sub-tasks, and the problem is solved. In truth, it's
# not quite so simple, but all recursive algorithms have these same four steps.

# Examples of displaying a string in increasing numbers of characters.
# and computing the factorial of a value

#!c:\strawberry\perl\bin\perl.exe

use strict;
use warnings;

# prototype of a subroutine that accepts a string and
# then displays each of its characters (from left to right) on a single line
sub superWriteVertical($);

superWriteVertical("Hello World");
foreach (0 .. 10) {
   print "$_! = " . factorial($_) . "\n";
}


sub superWriteVertical($) {
   my ($len, $s);
   $s = shift(@_);
   $len = length($s);

   if($len>0) { # base case
      superWriteVertical(substr($s, 0, $len - 1));  # progression toward the base case (simulating a loop)
						    # each function call is placed on the system STACK!
      print "$s\n";                                 # display of the digit
   }
}

sub factorial {
   my $number = shift;   # get the argument

   if($number <= 1) {    # base case
      return 1;
   }
   else {                # recursive step
      return $number * factorial($number - 1);
   }
}
