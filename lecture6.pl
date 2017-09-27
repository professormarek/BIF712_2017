#perl hashes
#a hash is another name for "associative array", "dictionary", "mapping", "map", "hashmap"
#which is another way of describing a container of "key-value" pairs
#think of it as an array or list, but the indicies are strings instead of integers
#the keys are unique, and the value stored under that string can be a number, string, or reference
#to declare a hash we use the my keyword, followed by a name preceeded with a % rather than $ or @

#syntax:
# my %hash = ( ); #initialize empty hash

# key => value

my %airports = (CDG => "Paris", YYZ => "Toronto", YYK => "Calgary", YWG => "Winnipeg");

#to access individual elements you simply specify the "key" of the element you want
#within { } curly braces.
#example, print Toronto out of the hash of airports

print "Airport with code YYZ is: $airports{'YYZ'} \n";

$key = "YYZ";
$name = $airports{$key};

print "Airport with code $key is: $name\n";

#to add new entries into the hash table:
$airports{JFK} = "New York City";
#verify...
print "Airport with code JFK is: $airports{'JFK'} \n";

#some important hash functions:

#to get a list (array) of key names use the keys keyword
# keys(%hash)
my @cityCodes = keys(%airports);
print "the keys in our aiports hash are: @cityCodes\n";
#to remove entries from the hash use delete with the appropriate key
# delete $hash{key}
delete($airports{YWG}); #cannot delete by VALUE, must delete by KEY
#to reverse the key=>value relationships for all key-value pairs
# reverse(%hash)
#to get all the element values in some arbitrary order
# values(%hash)
my @cityNames = values(%airports);
print "the values in our aiports hash are: @cityNames\n";

#to check whether a key-value pair exists in the hash without retrieving the element
# exists ($hash{KEY})
#note that exists will return TRUE if the KEY has EVER been used to store a value in the hash
#even if that value is currently empty
$temp = exists($airports{JFK});
print "Does JFK exist?: ", $temp , "\n";
$temp = exists($airports{YWG});
print "Does YWG exist?: ", $temp , "\n";









