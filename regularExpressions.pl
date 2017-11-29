Seneca College
# BIF712 Lecture #9
# Tuesday November 17, 2016

# To check version of Perl installed on your system: Perl -v
# This semester (Fall 2016) we will be using Perl version 5.24.0

use warnings;
use strict;

our $platform = "DOS"; # a GLOBAL variable

# Regular Expressions:
# Regular expressions are search patterns. They are written using a
# particular syntax and are compiled and then executed -- so regular
# expressions are a computer language in their own right.
# There are many different dialects of regular expressions;
# The Perl version (PCRE) is one of the more powerful versions in use today!

# A regular expression ("regex" or "regexp" for short) is compared
# against input data to find matches. If there are several possible
# matches in the input data, the rule is that the regular expression
# engine will match the LEFTMOST and LONGEST possible match.

# Regular expressions are created from some combinations of these components:

# Characters
# Wildcards
# Repetition ("quantifiers")
# Anchors ("assertions")
# Alternation
# Grouping

# The forward-slash character is often used to quote regular
# expressions and will be used in the examples here to make it
# easy to identify the regular expressions being used.

# Anchors and assertions do not match specific characters, but
# do match specific locations or conditions.

# ^ matches the beginning of the line
# $ matches the end of the line
# \b matches a word boundary
# \B matches a non-(word boundary)
# A word boundary exists before the first character in the string, if the
# first character is a word character.
# After the last character in the string, if the last character is a word character.
# Between two characters in the string, where one is a word character and the other
# is not a word character.

# Example:
# /^car$/ matches "car" by itself but not "carrot"
# /\bor\b/ matches "or" in "his or hers" but not in "poor" or "order"
# /^$/ matches an empty line

# Individual characters are called "atoms", or specific pieces of
# text that need to be matched.
# Any alphanumeric character matches itself: /Hello/ matches "Hello"

# Any non-alphanumeric character will match itself if preceded by
# a backslash: /\@\(foo\)/ matches "@(foo)"

# Character classes may be specified using square-brackets [ ].
# A character class will match any one character listed in the
# square-brackets; ranges may be specified with a dash. A carat
# symbol "^" at the start of the class will invert the meaning of
# the character class and cause it to match any character which is NOT listed.

# Example:
# [12345] matches 1, 2, 3, 4, or 5
# [1-5] matches 1,2,3, 4, or 5
# [1-590] matches 1, 2, 3, 4, 5, 9, or 0
# [^0-9] matches any character which is not a digit
# [^:] matches any character which is not a colon

# Perl provides backslashed shortcuts for some of these classes and
# these may also be used outside of the square brackets:

# digit \d
# space \s
# word \w (a word-character, not a full word)
# A \w matches a single alphanumeric character (an alphabetic character, or a decimal digit);
# or a connecting punctuation character, such as an underscore ("_"); or a "mark" character
# (like some sort of accent) that attaches to one of those.

# \W non-word character
# \S non-whitespace character (not space or tab)
# \D non-digit character

# Plus these additional characters and escapes which are normally
# available in interpolated strings:

# \t tab
# \n newline
# \r carriage return

# Alternation lets you write alternative text; either the text
# before the alternation character "|" may be matched. The alternation
# character may be used multiple times to specify more than two alternate values.

# Example:
# /Hello|Goodbye/ matches "Hello" or "Goodbye"
# /red|blue|green house/ matches "red house" or "blue house" or "green house"

# The wildcard character "." matches any one character.

# Example:
# /l.ss/ matches "lass", "loss", "liss", "l9ss", ...
# /l...s/ matches "ladds", "likes", "loses", ...

# A quantifier specifies how many times the preceding atom must be matched.
# Quantifiers may take any of these forms:
# {count}
# {minimum,}
# {minimum, maximum}
#
# These short forms are available:
#
# ? same as {0,1}
# + same as {1,}
# * same as {0,}
#
# Normally, a quantifier is 'greedy' -- it will match as many
# characters as possible (because of the "leftmost and longest" rule).
# You can reverse that to make a quantifier match as few characters
# as possible by adding a question mark at the end:
#
# {0,5}?
#
# matches 0 to 5 of the preceeding atom, but ONLY as few as possible.
#
# Examples:
# /a{5}/ matches "aaaaa"
# /a{2,5}/ matches "aa", "aaa", "aaaa", or "aaaaa"
# /a.*z/ matches anything starting with a and ending with z
# /[a-z]{5,}/ matches 5 or more lowercase letters
#
# If your input pattern is "1aaaa2aaaa3aaaa4aaaa5aaaa6nnnn":
# /1a*2/ matches "1aaaa2"
# /2[a0-9]*6/ matches "2aaaa3aaaa4aaaa5aaaa6"
# /[0-9].*[0-9]/ matches "1aaaa2aaaa3aaaa4aaaa5aaaa6"
# /[0-9].*?[0-9]/ matches "1aaaa2"
#
#
my @regx = qw/1a*2 2[a0-9]*6 [0-9].*[0-9] [0-9].*?[0-9]/;
my $string = "1aaaa2aaaa3aaaa4aaaa5aaaa6nnnn";
foreach(@regx) {
   print "reg expression: $_ match found... $1\n" if($string =~ /($_)/);
}

# the $1 is known as a backreference that holds the exact portion of the text
# that matched the first group being searched.
# similarly, $2 would hold (group 2), $3 (group 3), etc.

# The Match Operator:  m//
# Perl has two operators which use regular expressions: m// and s///
#
# The Match Operator  m// returns 'true' if a match is found.
# It is written as "m", followed by a delimiter, followed by the regular
# expression, followed by the closing delimiter.
#
# The delimiter is typically "/" but most punctuation symbols may be used:
#
# m/foo/
# m"foo"
# m'foo'
# m|foo|
# m=foo=
#
# If the delimiter is "/", then the "m" may be left off:
#
# /foo/
#
# If the delimiter is any type of left bracket or parenthesis, the right
# version of that symbol must be used as the right delimiter:
#
# m(foo) m{foo} m[foo]
#
# A delimiter may be included in a regular expression by escaping it with "\":
#
# m/text\/html/
#
# It is recommended that you use "/" unless there is a good reason
# not to do so (such as having "/" in the pattern, which is the case
# with MIME-types and filenames).
#
# The match operator normally operates on $_. You can cause it to operate
# on another variable by 'binding' it to that variable using the binding
# operator '=~':
#
# $foo =~ m/regexp/
#
# You may also bind with '!~' which inverts the sense of the match
# (looks for non-matches, like using the '-v' argument with the
# Unix 'grep' command).
#
# The Substitution Operator: s///
# This operator substitutes some new text for matched text. The basic form is:
#
# s/regexp/newtext/
#
# Like m//, many different delimiters may be used. If the delimiter is a
# parenthesis or bracket, a different delimiter may be used for the
# newtext argument:
#
# s/regexp/newtext/
# s|regexp|newtext|
# s (regexp) {newtext}
# s [regexp] [newtext]
# s [regexp] /newtext/
# s (newtext)
#
# By default, s/// is bound to $_. This may be changed using "=~".
#
# Binding works the same way as with "m//", except that the expression to
# which s/// is bound must be modifiable (you can't bind s/// to a constant):
#
# $foo =~ s/house/home/;
#

$string = "this is the house that was used as a model for other houses";
$string =~ s/house/home/g;

print "string is: '$string'\n";

open(FD, "< test.html") || die("file I/O error: $!\n"); # open file for reading
$/ = undef;                                             # set default record separator to undefined
my $file = <FD>;                                        # file "slurp" (reads the entire file into the scalar $file)
print "matched portion: '$1'\n" if($file =~ s/<(.*)>/<\L$1>/g);

close(FD);
print "$file\n";
$/ = "\n";                                              # reset record separator
open(FD, "> testfix.html") || die("file I/O error: $!\n");
print FD $file;
close(FD);


# Pattern Modifiers
# After the closing delimiter in m// or s///, you may add one or more
# pattern modifiers.
#
# The most common pattern modifiers are:
# i ignore case
# x ignore whitespace and permit comments in patterns
# g global
# m allow ^ and $ to also match next to an embedded newline
# s allow . to also match a newline character

#
# IGNORE CASE: i
# This is similar to the Unix 'grep' command's '-i' flag.
# m/HOUSE/ matches "HOUSE"
# m/HOUSE/i matches "HOUSE", "House", "house", "hOuSe", ...
#
# IGNORE WHITESPACE: x
# This permits you to make your regular expressions more readable
# by adding whitespace and comments.
#
# For example
# m/^([^:]*:){3}/
#
# Could be written as:
# m/^       # Start at start of line
# (         # New group
#    [^:]*  # Any number of non-colons
#    :      # A colon character
# )         # End group
# {3}       # Repeat the group 3 times
# /x
#
# If you want to include whitespace when using the 'x' modifier,
# place it in a character class or use \s.
#
#
# GLOBAL: g
#
# Normally, m// or s/// apply only once -- the first match is found, or
# the first occurrence is substituted.
# Using the pattern modifier 'g' causes m// and s/// to act globally.
#
# m/regexp/g returns all matches in a list context (if you are capturing,
# all the captured data is returned, otherwise, all the matching lines
# are returned).
# In a scalar context, it causes a progressive match, where the first
# match is returned
# the first time it is performed, the second match the second time it
# is performed, and so forth.
#
# s/regexp/newtext/g causes all of the occurrences of regexp to be
# replaced by newtext instead of just the first one.
# (Note: in a few cases with overlapping regexps, a global
# substitution may not perform all possible substitutions. In that case,
# you may need to loop until the s///g fails).
#

# examples:
# remove leading whitespace in a string:
clear( );
my $string = "          Perl regular        expressions are great!        \n        ";
$string =~ s/^\s+//;    # remove leading whitespace
print "+$string+";

$string =~ s/\s+/ /g;   # remove embedded whitespace
print "+$string+";

$string =~ s/\s+$//g;   # remove trailing whitespace
print "+$string+";


# Translation: tr/// y///
#
# There is one more operator which is very useful:
# 'tr///' (which is the same as 'y///').
# Although this operator does not use regular expressions, it does use
# the same binding operator as m// and s///.
#
# Syntax:
# tr/characters/replacements/
#
# Any character in 'characters' is replaced by the corresponding character
# in 'replacements'.
#
# Example:
# tr/abc/ABC/
#
# Replaces "a" with "A", "b" with "B", and "c" with "C".
#
# The characters list may be specified using ranges
# (think of it as a character class):
# tr/0-9/x/
#
# This translates each digit to an 'x'.
#
# If the list of replacements is shorter than the list of characters,
# the last character is repeated as many times as necessary. If the
# replacements list is null, the characters list is also used as the
# replacements list.
#
# tr/// is bound to $_ by default. It may be bound to other variables
# by using "=~", just like m// and s///.
# Like s///, tr/// must be bound to a variable; it is invalid to bind
# it to a literal.


# Regular Expression Summary:
# The characters below have special meaning within a regular expression
# and must therefore be commented out using a backslash '\' if you
# wish to use them as a literal character.
# Special characters are:
#   .  *  +  [  ]  (  )  {  }  ^  $  |  \
# All other charecters assume their literal meanings.

# Special uses of the ^ and $ characters:
# ^ Anchors the expression to the beginning (start) of
#   the field when used inside a regexp
#   (eg. /^[A-Z]/  (starts with a capital alphabetic character)
#   Used as an exclusion operator when used inside a range
#   (eg. /[^A-Z]/  (is NOT an alphabetic character)

# $ Anchors the expression to the end of the field when used inside
#   a regexp (eg. /[A-Z]$/  (ends with a capital alphabetic character)

# Summary Table
# Metacharacter:   Meaning:
# [abc]            any one of the characters a, b, or c
# [^abc]           any one character other than a, b, or c
# [a-z]            any one ascii character between 'a' and 'z'
# \d               any digit [0-9]
# \D               any NON-digit [^0-9]
# \w               any word character [0-9a-zA-Z_]
# \W               any NON-word character [^0-9a-zA-Z_]
# \s               any whitespace character [ \n\t\r]
# \S               any NON-whitespace character [^ \n\t\r]
# \b               the boundary between a \w and a \W character
# .                any character apart from the newline '\n'
# (abc)            the phrase 'abc' as a group
# ?                preceeding character or group may be present
#                  0 or 1 times
# +                preceeding character or group is present
#                  1 or more times
# *                preceeding character or group may be present
#                  0 or more times
# {x,y}            preceeding character or group is present
#                  between x and y times
# {,y}             preceeding character or group is present
#                  at most y times
# {x,}             preceeding character or group is present
#                  at least x times
# {x}              preceeding character or group is present x times

# matching:
# m/regular expression/
# Indicates that the regular expression inside the / / is going
# to match the the scalar variable on the left side of the =~ or !~

# substituting:
# s/regular expression/replacement text/
# Indicates that the regular expression inside the first / /
# will be replaced by the text inside the second / /
# (eg. s/A/a replaces the first 'A' with a 'a')
# NOTE: modifiers may be used with a substitution expression:
#       s/A/a/g  substitutes all 'A's with 'a's (g) Globally.
#       s/help/HELP/i substitues characters ignoring case (i)

# translating:
# tr/character class/substitute class/
# Takes the range of characters within the first / / and
# replaces them with the corresponding characters with the second / /
# (eg. tr/[0-9]/[a-j]/ replaces all occurrences of the digits 0-9
#      with the charcaters a-j. 0->a, 1->b, 2->c, etc.

# For these questions, assume the platform you will be working
# on is Linux/Unix, although if written correctly, your code
# should execute without modification on Win 95/98/NT/2000 also!

# For the questions below, assume that you will be testing regular
# expressions on a basic string ($scalar) variable.

# Q01:  Write the perl regular expressions (regexp) which will
#       do the following:
#       If any of the conditions are encountered, print the message
#       "Exception Found..." to the screen.

# a)    Tests to see if a string contains any NON-alphanumeric data
#       (i.e. contains something other than digits or alphabetic
#       characters).
# b)    Makes sure that a string contains only UPPER case alphabetic
#       characters.
# c)    Makes sure that a field (string) contains a single positive
#       whole number value.
# d)    Tests to see if a string contains 2 or more whitespace
#       (' ', '\t', '\n') characters.
# e)    Makes sure that a field contains at least 1 NON-whitespace
#       character.

# Q02:  Explain what each of the following operations are doing:
# a)    $var =~ /(\w+)$/
# b)    $code !~ /^#/
# c)    s/#{2,}/#/g
# d)    /^[0-9]+$/
# e)    $guess =~ /((^[0-9]+\.?)$)|((\.[0-9][0-9]*)$)/

# Q03:  Replace every occurrence of the character s (upper or lowercase),
#       in the string "She sells sea shells by the sea shore.", with
#       the character 'T'.

# Q04:  Using the split( ) function, break up the string:
#       fname:lname:e-mail:addr:date:time into separate words,
#       and store the list as an array of words.

# Q05:  a) Using the join( ) function, connect the words you created
#          above to re-create the string as follows:
#          fname|lname|e-mail|addr|date|time

# Q06:  Write a complete Perl program which opens a plain text file
#       and replaces every occurence of the word "he" with the
#       word "she".

# Q07:  Write the regular expression that validates a Canadian POSTAL CODE
#       in the form LetterNumberLetter (embedded space or - permitted) NumberLetterNumber

# Q08:  Write the regular expression that validates a North American telephone number
#       in the form:  nnn (optional space or - permitted)
#                     nnn (optional space or - permitted)
#                     nnnn
#       Such that n are digit characters ONLY.

# Q09:  Write the regular expression that validates an email address in the form:
#       username@host.domain
#       such that
#       username: MUST contain at least 2 alphabetic characters and may contain
#                 special characters - and . but MAY NOT end with a - or .
#       host:     MUST contain at least 2 alphabetic characters and may contain
#                 special characters - and . but MAY NOT end with a - and MUST end with a .
#       domain:   MUST contain at least 2 alphabetic characters, but no more than 4.

# simple subroutine to clear screen in UNIX/DOS
sub clear {
   my %tbl = ( LINUX => "clear", DOS => "cls" );
   if($platform eq "LINUX") {
      system("$tbl{LINUX}"); # clear screen in UNIX/LINUX
   }
   else {
      system("$tbl{DOS}");  # clear screen in DOS
   }
}
