#!/usr/bin/perl -w
#
# ./zadatak10.pl localhost_access_log.txt

use strict;
use warnings;

my %clients = ();


while(<>){


	chomp();

	my @parts = split /\ /;
	my $key = $parts[0];
	my $value = $parts[scalar(@parts)-1];

	next if $value eq '-';

	$clients{$key} = $clients{$key} || 0;
	$clients{$key} += $value;
}

foreach (sort {$clients{$b} <=> $clients{$a} }
           keys %clients)
{
    printf "%s : %d\n", $_, $clients{$_};
}