## -*- Cperl -*-
package Crypt::Rot13;
$VERSION = '0.01';
use strict;
use Carp;

###############################################################################
## Copyright (C) 1999 julian fondren

## This program is free software; you can redistribute it and/or
## modify it under the terms of the GNU General Public License as
## published by the Free Software Foundation; either version 2 of
## the License, or (at your option) any later version.

## This program is distributed in the hope that it will be
## useful, but WITHOUT ANY WARRANTY; without even the implied
## warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the GNU General Public License for more details.

## You should have received a copy of the GNU General Public
## License along with this program; if not, write to the Free
## Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
## MA 02111-1307 USA
###############################################################################

##
# The current rot13 method will be *drastically* changed in the future, my
# original intention was to just release Crypt::Rot13 and promise a feature
# of multiple rotations in the next. This way the module can be used in
# exactly the same way (much better, OO wise) right now is in the next
# release without care to the fact that the rotational bits are a tad silly.

# and also, striving for a WORKABLE version of something before you start
# on a warpath of optimization and the "best way" that so many newbies seem
# to want to jump immediately to is a recent rant of mine. This module is
# not likely to go through many versions -- I may as well give it a few!
##


sub new {
  my $proto = shift;
  my $class = ref($proto) || $proto;
  my $self  = [];
  bless($self, $class);
  return $self;
}

sub peek {
  my $self = shift;
  return @{$self};
}

sub charge {
  my $self = shift;
  return @{$self} = @_;
}

sub rot13 {
  my $self = shift;
  my $degree = shift || 13;         # how much to rotate?
  croak "Invalid rotation" if ($degree > 26 or $degree < 0);
  my @rots = ( "a-z", "bcdefghijklmnopqrstuvwxyza",
	       "cdefghijklmnopqrstuvwxyzab", "defghijklmnopqrstuvwxyzabc",
	       "efghijklmnopqrstuvwxyzabcd", "fghijklmnopqrstuvwxyzabcde",
	       "ghijklmnopqrstuvwxyzabcdef", "hijklmnopqrstuvwxyzabcdefg",
	       "ijklmnopqrstuvwxyzabcdefgh", "jklmnopqrstuvwxyzabcdefghi",
	       "klmnopqrstuvwxyzabcdefghij", "lmnopqrstuvwxyzabcdefghijk",
	       "mnopqrstuvwxyzabcdefghijkl", "n-za-m",
	       "opqrstuvwxyzabcdefghijklmn", "pqrstuvwxyzabcdefghijklmno",
	       "qrstuvwxyzabcdefghijklmnop", "rstuvwxyzabcdefghijklmnopq",
	       "stuvwxyzabcdefghijklmnopqr", "tuvwxyzabcdefghijklmnopqrs",
	       "uvwxyzabcdefghijklmnopqrst", "vwxyzabcdefghijklmnopqrstu",
	       "wxyzabcdefghijklmnopqrstuv", "xyzabcdefghijklmnopqrstuvw",
	       "yzabcdefghijklmnopqrstuvwx", "zabcdefghijklmnopqrstuvwxy",
	       "a-z");
  my @rot13;
  foreach ($self->peek()) {
    eval "y/a-zA-Z/@{[$rots[$degree] . uc($rots[$degree])]}/";
    push @rot13, $_;
  }
  return @rot13;
}


1;

__END__

=head1 NAME

Crypt::Rot13 - a rotational deviator

=head1 SYNOPSIS

  #!/usr/bin/env perl
  $^W = 1;
  use strict;
  use Crypt::Rot13;

  my $cryptochango = new Crypt::Rot13;
  $cryptochango->charge("Someone help us, please!");
  print $cryptochango->rot13(5), "\n";

=head1 DESCRIPTION

Rot13 provides an object into which arrays may be placed, and
then returned to you in altered - specifically: rotated - form. The
above code would print, "Xtrjtsj mjqu zx, uqjfxj!". If instead of
rot13(5), rot13(11) had been used the result would have been
"Dzxpzyp spwa fd, awpldp!", and of course just rot13() would have
resulted in the expected, "Fbzrbar uryc hf, cyrnfr!". Valid rot13()
arguments are 0-26, though 0 and 26 do not alter the array.

Crypt::Rot13 has the following methods.

=over 2

=item new

standard constructor, this creates an array object, which is most
convienent for mass text deviation.

=item charge

defines the array object.

=item peek

returns unaltered value of array object
NOTE: rot13 as described above does not alter the object!

=item rot13 degree

rotates alphabetical characters of array object degree times toward the
Unreachable Wrapping Z, or 13 times if degree is omitted.

=back

=head1 AUTHOR

Julian Fondren is julian@imaji.net, and can usually be found on
#Perl, EFnet IRC.

=head1 SEE ALSO

perl(1)

=cut
