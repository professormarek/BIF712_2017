#!/usr/bin/perl

use strict;
use warnings;

# CGI example using perl CGI module
use CGI ":standard";

my $cgi = new CGI;      # read in parameters

print $cgi->header( );  # print the HTML header

my $fname  = $cgi->param('fname');
my $lname  = $cgi->param('lname');
my $passwd = $cgi->param('passwd');

my $color = $cgi->param('bgcolor');
my $font  = $cgi->param('font');
my $text  = $cgi->param('ttype');
my $size  = $cgi->param('size');
my @courses = $cgi->param('courses');

print $cgi->start_html( -title=>"Chooser Results...",
            -bgcolor=>"$color"
              ), "\n";

print "<font face='$font' size='$size'>\n";
print "first name: $fname<br />\n";
print "last name: $lname<br />\n";
print "password : $passwd<br />\n";

print "courses selected: @courses<br />\n";
print "<$text>\n";
print $cgi->param('text'), "\n";
print "</$text>\n";
print "</font>\n";

print $cgi->end_html( );