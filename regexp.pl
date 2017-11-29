#!/usr/bin/perl

#this program reads lines from standard input and matches specified lines using regular expressions

#STEP 1 read lines from STDIN using a loop and print them out
use strict;
use warnings;

my $line;
foreach $line(<STDIN>){
        #print $line;
        if($line =~ /,/){
                print $line;
        }
}
