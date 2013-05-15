#!/usr/bin/perl -w
#
#./zadatak4 < labosi-zakljucano.csv

use strict;
use warnings;

my @students = ();

while(<>){
    chomp;
    my $student = new student( split /;/ );
    push @students, $student;
}

foreach (@students){
    if( !$_->in_time ){
        $_->display_failed;
    }
}

##################

package student;

sub new{
    my $class = shift;
    my $self = {
        _jmbag => shift,
        _name => shift,
        _surname => shift,
        _term => shift,
        _locked => shift,
    };

    bless $self, $class;
    return $self;
}

sub in_time{
    my $self = shift;
    my( $termdate, $termtime ) = split /\ /, $self->{_term};
    my( $lockeddate, $lockedtime ) = split /\ /, $self->{_locked};

    if( $termdate ne $lockeddate ){
        return 0;
    }

    $termtime =~ s/://g;
    $termtime .= "00";
    $lockedtime =~ s/://g;

    my $diff = $lockedtime - $termtime;

    if( $diff > 10000 || $diff < 0 ){
        return 0;
    }
    return 1;
}

sub display_failed{
    my $self = shift;
    print $self->{_jmbag} . " " . $self->{_surname} . " " . $self->{_name} .
        " - PROBLEM: " . substr( $self->{_term}, 0, 16 ) . " --> " .
        substr( $self->{_locked}, 0, 19 ) . "\n";
}
