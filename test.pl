BEGIN { $| = 1; print "1\n"; }
END { $loaded ? print "ok 1\n" : print "not ok 1\n"; }

$^W = 1;

use Crypt::Rot13;
$loaded = 1;

# I don't want to get into return values >=(
# all of this should work, ->rot13() rotates with the degree of 13,
# others within the acceptable range of rotations rotate as such,
# but don't try to 'eq' a string with the return!
