#!/usr/bin/env perl
use Crypt::Rot13;
use strict;
$^W = 1; # -w
$|  = 1; # autoflush
sub test;

sub rot_test {
  my $rot13 = new Crypt::Rot13 ('abcdefghijklmnopqrstuvwxyz');
  my $rot;

  foreach (0 .. 26) {
    $rot = ($rot13->rot13 ($_))[0];
    unless (<DATA> eq "$rot\n") {
      return 0;
    }
  }
  return 1;
}
  
test (1, "loading", sub { use Crypt::Rot13; 1; });
test (2, "checking correct rotations", \&rot_test);


sub test {
  my ($number, $purpose, $test) = (shift, shift, shift);

  print "Test $number ($purpose)...";
  print &$test () ? "ok\n" : "not ok\n";
}


__DATA__
abcdefghijklmnopqrstuvwxyz
bcdefghijklmnopqrstuvwxyza
cdefghijklmnopqrstuvwxyzab
defghijklmnopqrstuvwxyzabc
efghijklmnopqrstuvwxyzabcd
fghijklmnopqrstuvwxyzabcde
ghijklmnopqrstuvwxyzabcdef
hijklmnopqrstuvwxyzabcdefg
ijklmnopqrstuvwxyzabcdefgh
jklmnopqrstuvwxyzabcdefghi
klmnopqrstuvwxyzabcdefghij
lmnopqrstuvwxyzabcdefghijk
mnopqrstuvwxyzabcdefghijkl
nopqrstuvwxyzabcdefghijklm
opqrstuvwxyzabcdefghijklmn
pqrstuvwxyzabcdefghijklmno
qrstuvwxyzabcdefghijklmnop
rstuvwxyzabcdefghijklmnopq
stuvwxyzabcdefghijklmnopqr
tuvwxyzabcdefghijklmnopqrs
uvwxyzabcdefghijklmnopqrst
vwxyzabcdefghijklmnopqrstu
wxyzabcdefghijklmnopqrstuv
xyzabcdefghijklmnopqrstuvw
yzabcdefghijklmnopqrstuvwx
zabcdefghijklmnopqrstuvwxy
abcdefghijklmnopqrstuvwxyz
