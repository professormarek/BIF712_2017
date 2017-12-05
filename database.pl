Seneca College
# BIF712 Lecture #12
# Tuesday December 1, 2015

Perl Database Interactivity and Recursion:

Beginning with version 5, Perl has made interacting databases and writing applications using
DBI module a simple process. DBI stands for: Database Independent Interface. The Perl DBI module
provides an abstraction layer between the Perl code and the underlying database, allowing
programmers to easily switch database implementations.

Architecture of a DBI Application:
The DBI module is independent of currently available databases and can be used with Oracle,
MySQL, SQLite3, Informix, etc.

				   +---> DBD::Oracle  --> Oracle RDBMS
				   |
Perl Script--> API --> DBI --+---> DBD::SQLite3 --> SQLite3 RDBMS
				   |
				   +---> DBD::MySQL   --> MySQL RDBMS

In this model, the DBI module handles all SQL commands through the API,
(i.e., Application Programming Interface) and relays them to the appropriate driver for actual
execution. DBI is also responsible for processing results from the driver and sending them
back it to the Perl script.

To INSTALL the Perl DBI and specific DataBase Driver (assume SQLite3), into your Perl
distribution, you can use the commands:

perl -MCPAN -e "install DBI"

perl -MCPAN -e "install DBD::SQLite"  or...

perl -MCPAN -e "install DBD::mysql"   (for access to a MySQL database) or...
perl -MCPAN -e "install DBD::Oracle"  (for access to an Oracle database)


Database Connection:
The examples below will demonstrate how to connect, insert data into, and retrieve
data using the SQLite3 database (assumes that you have installed SQLite3 on your
Perl distribution).

SQLite implements most of the SQL-92 standard for SQL. The SQLite engine is not a standalone
process. Instead, it is statically or dynamically linked into the application. An SQLite
database is a single ordinary disk file that can be located anywhere in the directory hierarchy.
SQLite comes with the sqlite3 command line utility and can be used to issue SQL commands against
a database.

For example, to use the sqlite3 command line tool to create a new database 'test.db':
NOTE: Enter SQL statements terminated with a ";" and
      enter .help for a list of available commands and .exit to quit.

$ sqlite3 test.db
sqlite> .tables
sqlite> .exit
$ dir
11/22/2015  09:43 AM                 0 test.db


Common DBI methods:
The following table lists some common DBI methods.

Method name             Description
available_drivers( )       Returns a list of all available drivers
connect( )              Establishes a connection to the requested data source
disconnect( )           Disconnects from the database server
prepare( )              Prepares an SQL statement for execution
execute( )              Executes the prepared statement
do( )                   Prepares and executes an SQL statement
bind_param( )           Associates a value with a placeholder in a prepared statement
bind_col( )             Binds a Perl variable to an output field of a SELECT statement
begin_work( )           Starts a new transaction
commit( )               Writes the most recent series of uncommitted database
			changes to the database
rollback( )             Undoes the most recent series of uncommitted database changes
quote( )                Quotes a string literal for use as a literal value in an
			SQL statement
dump_results( )         Fetches all the rows and prints them
fetchrow_array( )       Fetches the next row as an array of fields
fetchrow_arrayref( )    Fetches the next row as a reference array of fields
fetchrow_hashref( )     Fetches the next row as a reference to a hashtable
fetchall_arrayref( )    Fetches all data as an array of arrays
finish( )               Finishes a statement and lets the system free resources
rows( )                 Returns the number of rows affected
column_info( )          Provides information about columns
table_info( )           Provides information about tables
primary_key_info( )     Provides information about primary keys in tables
foreign_key_info( )     Provides information about foreign keys in tables

Conventions:

Perl programmers usually use the following variable names when working with Perl DBI:

Variable name           Description
$dbh                    Database handle object
$sth                    Statement handle object
$h                      Any of the handle types above ($dbh or $sth)
$rc                     General Return Code (boolean: true=ok, false=error)
$rv                     General Return Value (typically an integer)
@ary                    List of values returned from the database, typically a row of data
$rows                   Number of rows processed (if available, else -1)
$fh                     A filehandle
undef                   NULL values are represented by undefined values in Perl
\%attr                  Reference to a hash of attribute values passed to methods


Connecting to an SQLite database with Perl:
The first step is to connect to the database. Use the connect( ) DBI method to
establish a connection. The disconnect( ) method is used to close the database
connection.

The connect( ) method establishes a database connection to the requested data source
and returns a database handle object if the connection succeeds.
$dataSourceName is a string that tells the Perl DBI module what kind of driver it
should load and the location of the database to which the connection is going to be created
and can be one of (depending on the database being connected):

dbi:DriverName:database_name
dbi:DriverName:database_name@hostname:port
dbi:DriverName:database=database_name;host=hostname;port=port

The code example below retrieves and displays the version of the SQLite database:

#!c:\strawberry\perl\bin\perl.exe

use strict;
use warnings;
use DBI;

my ($dataSourceName, $dbh, $userName, $password, $sth, $version, $tableName);

$dataSourceName = "dbi:SQLite:dbname=test.db";
$userName = $password = "";

$dbh = DBI->connect($dataSourceName, $userName, $password) or die $DBI::errstr;

$sth = $dbh->prepare("SELECT SQLITE_VERSION( )");
$sth->execute( );

$version = $sth->fetch( );
print "@{$version}\n";

$sth->finish( );
$dbh->disconnect( );


INSERT Operation:
The example below will create a new table: lotto649WinningNums
into the lotto database and insert data from a file into the table:

#!c:\strawberry\perl\bin\perl.exe

use strict;
use warnings;
use DBI;

my ($dataSourceName, $dbh, $userName, $password, $sth, $version, $dataBaseName);
my ($sqlCommand, $fileName, $file, @records, @fields, @dateFields, $sqlDate, $rows, $tableName);
my ($id, $ddate, $ball1, $ball2, $ball3, $ball4, $ball5, $ball6, $bonus);

$dataBaseName = "lotto";
$tableName    = "lotto649WinningNums";
$dataSourceName = "dbi:SQLite:dbname=lotto.db";
$userName = $password = "";

$dbh = DBI->connect($dataSourceName, $userName, $password) or die $DBI::errstr;

$sqlCommand = <<"_END_";
CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT,
ddate DATE NOT NULL UNIQUE,
ball1 TINYINT UNSIGNED NOT NULL,
ball2 TINYINT UNSIGNED NOT NULL,
ball3 TINYINT UNSIGNED NOT NULL,
ball4 TINYINT UNSIGNED NOT NULL,
ball5 TINYINT UNSIGNED NOT NULL,
ball6 TINYINT UNSIGNED NOT NULL,
bonus TINYINT UNSIGNED NOT NULL);
_END_

print "'$sqlCommand'\n";

$dbh->do("DROP TABLE IF EXISTS $tableName");
$dbh->do($sqlCommand);

$fileName = "lotto649.dbase.formatted.txt";

open(FD, "< $fileName") || die("Error opening file... $file\n$!\n");
$/ = undef;
$file = ;
close(FD);
$/ = "\n";

@records = split('\n', $file);

foreach(@records) {
   @fields = split(/\s{1,}/, $_);   # require format to change: 6/19/1982 -> 1982-6-19
								# split on 1 or more spaces
   #print "fields[0]: '$fields[0]'\n";
   @dateFields = split('/', $fields[0]);
	$sqlDate   = sprintf("%s-%02d-%02d", $dateFields[2], $dateFields[0], $dateFields[1]);
					# 2 digit date fields required

   #print "record:     '@fields'\n";
   #print "dateFields: '@dateFields'\n";
   #print "sqlDate:    '$sqlDate'\n";
   #;
   $sqlCommand = "INSERT INTO $tableName" .
				"(ddate, ball1, ball2, ball3, ball4, ball5, ball6, bonus)" .
				"VALUES ('$sqlDate', $fields[1], $fields[2], $fields[3], $fields[4], " .
		 "$fields[5], $fields[6], $fields[7]);";
			   # NOTE: single quotes around date field required

	$dbh->do($sqlCommand);
}
$dbh->disconnect( );


Record creation takes the following steps:
Prearing SQL statement with INSERT statement. This will be done using prepare( ) API.
Executing SQL query to select all the results from the database. This will be done using
execute( ) API.
Releasing Stattement handle. This will be done using finish( ) API.

READ Operation:
READ Operation on any databasse means to fetch some useful information from the database
(i.e.) one or more records from one or more tables. Once database connection is established,
a query can be made into the database.

#!c:\strawberry\perl\bin\perl.exe

use strict;
use warnings;
use DBI;

my ($dataSourceName, $dbh, $userName, $password, $sth, $version, $dataBaseName);
my ($sqlCommand, $rows, $tableName);
my ($id, $ddate, $ball1, $ball2, $ball3, $ball4, $ball5, $ball6, $bonus);

$dataBaseName = "lotto.db";
$tableName    = "lotto649WinningNums";
$dataSourceName = "dbi:SQLite:dbname=$dataBaseName";
$userName = $password = "";

$dbh = DBI->connect($dataSourceName, $userName, $password) or die $DBI::errstr;

$rows = $dbh->selectrow_array("SELECT * FROM $tableName;");
$sqlCommand = "SELECT * FROM $tableName;";
$sth = $dbh->prepare($sqlCommand);
$sth->execute( );
# $rows = $sth->rows( );

print "\n";
print "
\n";
print "sqlite>$sqlCommand\n";

while(($id, $ddate, $ball1, $ball2, $ball3, $ball4, $ball5, $ball6, $bonus) = $sth->fetchrow_array( )) {

   printf("+-------+------------+-----+-----+-----+-----+-----+-----+-----+\n");
   printf("| %5s | %s | %3s | %3s | %3s | %3s | %3s | %3s | %3s |\n",
	   $id, $ddate, $ball1, $ball2, $ball3, $ball4, $ball5, $ball6, $bonus);
   printf("+-------+------------+-----+-----+-----+-----+-----+-----+-----+\n");
   print "\n";
}
print "
\n";
$sth->finish( );
$dbh->disconnect( );
