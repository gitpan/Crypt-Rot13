BEGIN { $| = 1; print "1..2\n"; }
END {print "not ok 1\n" unless $loaded;
     print "not ok 2\n" unless $used;}
$^W = 1;

use Crypt::Rot13;
$loaded = 1;
print "ok 1\n";

my $cryptochango = new Crypt::Rot13;
$cryptochango->charge("Someone help us, please!");
$cryptochango->rot13(5);
$cryptochango->rot13(11);
$cryptochango->rot13;
$cryptochango->rot13(0);
$used = 1;
print "ok 2\n";
