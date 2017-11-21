use strict;
use warnings;


# Perl FILE I/O:
# In order to open files for reading and writing using
# the Perl language, you must invoke the open( ) built-in function:
# open FILEHANDLE, EXPR

# FILEHANDLE is the file descriptor (handle), but can be any valid identifier name
# < is used to indicate that the file will be opened for reading (default)
# EXPR specifies the name of the file on disk to open (including the mode) and
# may additionally include relative or absolute path information.
# NOTE: Windows directories are separated using the back slash '\' and on unix,
# the forward slash '/' is used.
# The die(...) built-in function:
# This function is executed if the open did not succeed and it displays an
# error message before terminating the Perl script!
# $! holds the default error message that a Perl script last encountered

# <  used to open a file for reading (default)
# >  used to open a file for writing
# >> used to open a file for appending

# Perl FILE I/O Modes:
# MODE:      ACCESS:
# < or r            Read Only Access
# > or w            Creates, Writes, and Truncates
# >> or a    Writes, Appends, and Creates
# +< or r+   Reads and Writes
# +> or w+   Reads, Writes, Creates, and Truncates
# +>> or a+  Reads, Writes, Appends, and Creates

# in place of the die(...) function (which terminates the script),
# Perl allows the function warn(...) that simply displays a message
# and allows the script to proceed.

my $ifile = "lecture7.pl";
my $ofile = "lecture7.copy.pl";

open(IN, $ifile) || die("Error opening file: $ifile... Message: $!\n");
open(OUT, "> $ofile") ||
   warn("Error opening file: $ofile... (must be a permission issue) $!\n");

my $line;
while($line = <IN>) {
   print "$line";
   print OUT $line; # printing to the file
}

# The Perl close(...) function:
# close FILEHANDLE
# To close a filehandle, and therefore disassociate the filehandle from the corresponding file,
# you use the close function. This flushes the filehandle's buffers and closes the system's
# file descriptor.
# If no FILEHANDLE is specified, then it closes the currently selected filehandle.
# It returns true only if it could successfully flush the buffers and close the file.

# close the file to allow other processes to use it
close(OUT) || die "Could not close output file '$ofile' properly... $!";
close(IN)  || die "Could not close input  file '$ifile' properly... $!";

# Reading the contents of an entire file into memory in one operation (file slurping).

my $inFile  = shift(@ARGV); # command line argument #1
my $outFile = shift(@ARGV); # command line argument #2

my ($fileData, $len);

open(IN,  "$inFile")    || die("Error: Could not open INPUT  file... '$inFile'  $!\n");
open(OUT, "> $outFile") || die("Error: Could not open OUTPUT file... '$outFile' $!\n");

$/ = undef;                 # setting the default record separator to undefined
$fileData = <IN>;           # slurping entire raw file into a scalar
close(IN);
$/ = "\n";                  # resetting default record separator
$len = length($fileData);   # determining the total number of bytes in the file

print "FILE DATA: '$fileData'\n";


# Perl FILE I/O functions:

# The getc(...) function:
# getc FILEHANDLE
# The getc function returns a single character from the specified FILEHANDLE, or STDIN
# if none is specified
# If an error occurs, or the filehandle is at end of file, then undef is returned instead.

# read(...) Function:
# read FILEHANDLE, SCALAR, LENGTH, OFFSET
# The read function reads a block of information from the buffered filehandle.
# This function is used to read binary data from the file.
# The length of the data read is defined by LENGTH, and the data is placed at the start of
# SCALAR if no OFFSET is specified. Otherwise data is placed after OFFSET bytes in SCALAR.
# The function returns the number of bytes read on success, zero at end of file,
# or undef if there was an error.

# print(...) function:
# print FILEHANDLE LIST
# For all the different methods used for reading information from filehandles,
# the main function for writing information back is the print function.
# The print function prints the evaluated value of LIST to FILEHANDLE, or to the
# current output filehandle (STDOUT by default).

# rename(...) function:
# This function accepts two arguments (the names of valid files on disk) and renames
# the first argument to the new name stored in the second argument.

# rename("pi.c", "pi2.c") || warn("Error renaming file... pi.c\n");

# unlink(...) function:
# To delete an existing file on disk, the unlink function may be used.

# unlink("garbage.txt") || warn("Error deleting file... garbage.txt\n");

# Perl File Information:
# You can test certain features very quickly within Perl using a series of test operators known
# collectively as -X tests.
# Listed below is a partial list of features, which you can use to check on a file or directory.

# Operator   Definition
# -B         Is it a binary file?
# -S         Is the file a socket?
# -T         Is it a text file?
# -b         Is it a block special file (like a DVD, CD-ROM, etc)?
# -c         Is it a character special file?
# -d         Is the file a directory?
# -e         Does the file exist?
# -f         Is it a plain file?
# -l         Is the file a symbolic link?
# -o         Is the file owned by the effective user ID?
# -p         Is the file a named pipe?
# -r         Is the file readable by the effective user or group ID?
# -s         Returns the size of the file, zero size = empty file.
# -w         Is the file writable by the effective user or group ID?
# -x         Is the file executable by the effective user or group ID?
# -z         Is the file size zero?
