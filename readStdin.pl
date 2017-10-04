#!/usr/bin/perl

#use chmod u+x to make this program executable
#then try piping data into it ex. using cat

use strict;
use warnings;

my $line;
foreach $line( <STDIN> ){
        chomp($line);
        print "$line\n";
}
