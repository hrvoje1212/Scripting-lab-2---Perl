#!/usr/bin/perl -w
#
#./zadatak6.pl primjer.txt rezultati.csv 3

use strict;
use warnings;

my $size = pop(@ARGV);
print "$size\n";
my %prefixes = ();

while(<>){
    chomp;
    my @parts = split /\ /;

    foreach( @parts ){
        my $word = lc($_);

        next if length($_) < $size;

        foreach ( keys(%prefixes) ){
            if( $word =~ /^$_/ ){
                $prefixes{$_} ++;
            }
        }

        my $mykey = (substr $word, 0, $size);

        $prefixes{$mykey} = $prefixes{$mykey} || 1;
    }
}

foreach (sort keys %prefixes){
    printf "%s : %3d\n", $_, $prefixes{$_};
}
