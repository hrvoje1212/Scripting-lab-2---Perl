#!/usr/bin/perl -w
#
#./zadatak3 < localhost_access_log.2008-02-25.txt

use strict;
use warnings;

my $date = "";

my %hours = ();

while(<>){
    chomp;
    s/^.*\[//;
    s/\s\+.*$//;

    my $date = substr $_, 0, 11;
    my $time = substr $_, 12;
    $time =~ s/:..:..$//;

    if( exists $hours{$time} ){
        $hours{$time}++;
    } else{
        $hours{$time} = 1;
    }

}

display_message($date);

for my $i("00".."23"){
    printf( " %s : %s\n", $i, $hours{$i} || 0 );
}


sub display_message{
    my $date = shift;
    print "Date: " . $date . "\n";
    print "sat : broj pristupa\n";
    print "---------------------------------\n";
}
