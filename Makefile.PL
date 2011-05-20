
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Capture STDOUT and STDERR from Perl, XS or external programs',
  'AUTHOR' => 'David Golden <dagolden@cpan.org>',
  'BUILD_REQUIRES' => {
    'Config' => '0',
    'File::Find' => '0',
    'Test::More' => '0.62'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Capture-Tiny',
  'EXE_FILES' => [],
  'LICENSE' => 'apache',
  'NAME' => 'Capture::Tiny',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Exporter' => '0',
    'File::Spec' => '0',
    'File::Temp' => '0',
    'IO::Handle' => '0'
  },
  'VERSION' => '0.11',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

if ( $^O eq 'MSWin32' ) {
  $WriteMakefileArgs{PREREQ_PM}{'Win32API::File'} = '0';
}

WriteMakefile(%WriteMakefileArgs);



