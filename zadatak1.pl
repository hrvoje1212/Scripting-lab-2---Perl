#!/usr/bin/perl -w
#
#./zadatak1.pl

use strict;
use warnings;

print "Unesi niz znakova: ";
my $buffer = <>;

print "Unesi broj ponavljanja: ";
my $n = <>;

print $buffer x $n;
