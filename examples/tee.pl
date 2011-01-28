#
# This file is part of Capture-Tiny
#
# This software is Copyright (c) 2009 by David Golden.
#
# This is free software, licensed under:
#
#   The Apache License, Version 2.0, January 2004
#
use strict;
use warnings;

use Capture::Tiny qw/capture tee/;

print "Type some text.  Type 'exit' to quit\n";
my ($out, $err) = tee {
  while (<>) {
    last if /^exit$/;
    print "Echoing to STDOUT: $_";
    print STDERR "Echoing to STDERR: $_";
  }
};

print "\nCaptured STDOUT was:\n" . ( defined $out ? $out : 'undef' ); 
print "\nCaptured STDERR was:\n" . ( defined $err ? $err : 'undef' ); 


