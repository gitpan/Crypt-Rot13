use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Crypt::Rot13',
    'VERSION_FROM' => 'Rot13.pm', # finds $VERSION
);
