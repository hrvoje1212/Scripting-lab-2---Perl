#!/usr/bin/perl -w
#
#./zadatak5 < rezultati.csv

use strict;
use warnings;

my @ratios = split /;/, <>;

my @students = ();

while(<>){
    chomp;
    my @parts = split /;/;

    my $points = 0;
    my $jmbag = shift(@parts);
    my $surname = shift(@parts);
    my $name = shift(@parts);

    for my $i(0..$#parts){
        next if $parts[$i] eq '-';
        next if $ratios[$i] eq '-';
        $points += $parts[$i] * $ratios[$i];
    }

    my $student = new student( $jmbag, $name, $surname, $points );
    push @students, $student;
}

@students = sort { $b->{_score} <=> $a->{_score} } @students;

print "Lista po rangu:\n";
print "-------------------------\n";

for my $i(0..$#students){
    printf "%3d. ", $i+1;
    $students[$i]->display;
    print "\n";
}


##################

package student;

sub new{
    my $class = shift;
    my $self = {
        _jmbag => shift,
        _name => shift,
        _surname => shift,
        _score => shift,
    };

    bless $self, $class;
    return $self;
}

sub display{
    my $self = shift;
    printf( "%-35s : %.2f", $self->{_surname} . ", " . $self->{_name} .
        " (" . $self->{_jmbag} . ")", $self->{_score} );
}
