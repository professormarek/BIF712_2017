# BIF712 Lecture #11
# Tuesday November 17, 2015

# To check version of Perl installed on your system: Perl -v
# This semester (Fall 2015) we will be using Perl version 5.22.0


#!/home/danny.abesdris/software/bin/perl

# Perl Modules:
# Perl Module Installation from CPAN
# Any perl module may be downloaded from CPAN and integrated into
# your perl distribution (provided of course that you have
# permissions to do so) by performing the following commands:

# /home/your_account>tar -xzf perl_module.tar.gz
# /home/your_account>cd perl_module
# /home/your_account>perl Makefile.PL
# /home/your_account>make
# /home/your_account>make test
# /home/your_account>make install

# Those commands also assume that module dependancies have been
# resolved prior to their installation (because many modules require that
# other (support) modules be installed first).

# A much easier way to install a Perl module from CPAN is via the
# command line:
# /home/your_account>perl -MCPAN -e "install perl_module"

# The previous command (above) will install the required module
# (including resolving any dependancies that the module may have).

# *** NOTE: For your second assignment this semester in BIF712, you will be required
#           to install the following modules into your raw Perl distribution (5.22.0)
#           on zenit:
#           perl -MCPAN -e "install Shell"
#           perl -MCPAN -e "install LWP::Simple"
#           perl -MCPAN -e "install CGI"
#
#           This is in addition to any other modules that you may wish to use!

# Perl CGI (Common Gateway Interface)

# CGI.pm is a library module and object module in one.
# For BIF712 we will use it as a library module (function interface).
# The argument to the CGI.pm module initialization controls which set of functions
# are exported into the namespace of the Perl program.
# The :standard argument refers to the current "standard" version of (x)html and is
# highly recommended. Therefore, to use CGI.pm in a Perl program, place this line
# at the beginning of your script:

# use CGI ":standard";

# Functions Provided by CGI.pm:
# CGI.pm provides several sets of functions. These are the most important three groups:
# HTML Output Functions:
# header( )      Returns http headers (e.g., Contenttype).
# start_html( )  Returns the xml declaration, DOCTYPE, and document head.
# end_html( )    Returns the end of the xhtml page xhtml (closes the body and html).
# tag( )         Returns the markup for tag, e.g., p("Test") returns <p>Test</p>
	       # However, when a tag conflicts with a builtin Perl function name, it is
	       # capitalized (e.g. Tr( ) ).

# Form Input Functions:
# param(x)       Returns the current value of the form element named x.
# param(x, y)    Sets the default value for the form element named x to y.
# Param( )       With no arguments returns a list of parameter names.
	       # This may be used as a boolean to determine if any parameters were
	       # submitted.

# Form Output Functions:
# start_form( )      Returns the markup to start an xhtml form.
# end_form( )        Returns the markup to end an xhtml form.
# textfield( )       Returns an input tag with a type of "text".
# password_field( )  Returns an input tag with a type of "password".
# hidden( )          Returns an input tag with a type of "hidden".
# submit( )          Returns an input tag with a type of "submit".
# image_button( )    Returns a clickable image button (submits form).
# button( )          Returns a JavaScript/ECMAscript action button.
# reset( )           Returns an input tag with a type of "reset".
# checkbox( )        Returns an input tag with a type of "checkbox".
# checkbox_group( )  Returns the xhtml for a group of checkboxes.
# radio_group( )     Returns the xhtml for a group of radio buttons.
# popup_menu( )      Returns the xhtml for a select element, including options.
# scrolling_list( )  Returns the xhtml for a multiline select element, inc. options.

# Argument Syntax:
# CGI.pm uses a unique argument syntax:
# function_name( {argname=>" value", otherarg=>" othervalue"}, data );
# Note: the dashes and curlybraces are not always required but
# it's easier to always use them than to remember when they are and are not required!

# Example: print p({-class=>"error"}, "The data you entered is invalid!" );
# Result: <p class="error">The data you entered is invalid!</p>

# Using CGI::Carp:
# The CGI.pm package provides a second module, CGI::Carp, which has a number of
# errorhandling capabilities.
# The most useful of these capabilities redirects fatal error messages to
# your browser window (instead of seeing "500 Internal Server Error", you will see
# your script's error message).
# This is enabled with the directive:
# use CGI::Carp "fatalsToBrowser";
# Preexecution errors (code with significant syntax errors for example) will still
# not show in the browser therefore you will need to test/execute
# such scripts from the shell prompt but other fatal errors will show in the
# browser display. You can also use the die( ) function to output an error page:
# die("The data file could not be opened.");

# CGI and Form environment requirements:
# 1. All web pages must be stored in your public_html/ directory on zenit.
#    The public_html/ directory is the base location that all scripts and CGI programs
#    are processed from by the web server (typically apache on unix/linux/mac os x systems).
# 2. In order to process form data from a client html page, your Perl CGI script must be
#    stored in the cgi-bin/ directory below public_html/ and must have read and execute
#    permissions enabled for the "other" group.
#    The command:
#       chmod 755 cgi-bin/
#    will suffice for the programs you will create this semester.
# 3. The Perl script itself (stored in the cgi-bin/ directory) must also
#    have execute permissions in order to work.
#    The command:
#       chmod 711 cgi-bin/myCgi.pl
#    is acceptable.
# 4. The first line output by your Perl CGI program MUST specify the correct
#    Content-type:
#    that your Perl program will outut (i.e. text, or images, or sound, etc.)
#    For your programs this semester, a Content-type of:
#
#    "Content-type: text/html\n\n"
#    is all that is required.
#    NOTE: The 2 (TWO) newlines are REQUIRED after the Content-type: directive!

use strict;
use warnings;

# CGI example using perl CGI module
use CGI ":standard";

my $cgi = new CGI;      # read in parameters

print $cgi->header( );  # print the HTML header
print "Hello Perl CGI World!";
print $cgi->end_html( );
