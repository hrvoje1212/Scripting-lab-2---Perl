#!/usr/bin/perl -w
#
# ./faktorijele.pl 9

use strict;
use warnings;

sub f(){

	my $n = shift;
	my $result = 1;

	foreach (1..$n){
		$result *= $_;
	}

	return $result;
}

my $t = shift;

foreach (1..$t){
	print &f($_) . " ";
}
print "\n";