#lecture 2
#in addition to math operators perl also has many powerful string manipulation 
#and inspection operators built in

#string concatenation is analogous to addition in math. it means to add strings together
#end-to-end resulting in a longer string (usually, unless one string is empty "")
#the operator to concatenate strings is "." (the dot or period character)
$s1 = "AUG-";
$s2 = "AAA";
$s12 = $s1 . $s2;
print "string 1 is: $s1, string 2 is: $s2, the concatenated strings are: $s12 \n";
#exercise: try concatenating a "literal string" "GGG" at the end of s12
#notice we can reassign the value on the lhs back to the original string, changing it
$s12 = $s12 . "GGG";
print "the modified s12 is: $s12\n";
#perl also has a repetition operator if you want to repeat strings
$s4 = "ACGT";
$s3 = $s12 . $s4 x5;
print "the concatenated string with repeated ending: $s3";
