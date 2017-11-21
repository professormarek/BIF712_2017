use strict;
use warnings;

sub isAlpha($); #forward declaration or prototype

print isAlpha("abcdefghijklmnopqrstuvwxyz"), "\n";
print isAlpha("Hello World"), "\n";
print isAlpha("OnlyAlphabeticCharacters9ArePermitted"), "\n\n";
my $value = isAlpha("AcZ");


print "the value returned was stored in the variable, and it's value is: ", $value ;

# this perl subroutine (user-defined) returns true only when all the
# characters in the string it accepts as a parameter are alphabetic!
sub isAlpha($) {
   my $s = shift(@_);
   my ($i, $rc); # assume string contains alphabetic characters!
   for($i=0, $rc=1; $i<length($s) && $rc == 1; $i++) {
      if(substr($s, $i, 1) lt 'A' || substr($s, $i, 1) gt 'z' ||
	 substr($s, $i, 1) gt 'Z' && substr($s, $i, 1) lt 'a') {
	 $rc = 0;
      }
   }
   return $rc;
}
