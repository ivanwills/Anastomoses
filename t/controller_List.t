#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
#use Log::Log4perl qw/ :easy /;
#Log::Log4perl->easy_init($FATAL);

eval "use Test::WWW::Mechanize::Catalyst 'Questions'";
if ($@) {
    diag "\n$@";
    plan skip_all => 'Test::WWW::Mechanize::Catalyst required';
    exit 0;
}

plan tests => 2;

ok( my $mech = Test::WWW::Mechanize::Catalyst->new, 'Created mech object' );

$mech->agent_alias("Linux Mozilla");


$mech->get_ok( 'http://localhost/list/' );

done_testing();
