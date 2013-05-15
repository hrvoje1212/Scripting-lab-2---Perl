#!/usr/bin/perl -w
#
#./zadatak2.pl

use strict;
use warnings;

print "Unesi niz brojeva: ";
my @numbers = ();

while(<>){
    chomp( $_ );
    $_ =~ s/^\s+//;
    my @lineElements = split( /\s+/, $_ );
    push( @numbers, @lineElements );
}

print "\nElementi liste: ";

my $sum = 0;
foreach (@numbers){
    $sum += $_;
    printf "%s ", $_;
}


print "\nAritmeticka sredina: " . $sum / scalar( @numbers ) . "\n";
