#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

use lib 't/lib';
use lib 'lib';
use Animal;

plan tests => 2;

# Test basic Animal accessors;
my $dog_name = "rock";
my $dogy = Animal->new()->name($dog_name);

ok( $dogy->can("name"), "There is an accessor 'name'" );

$dogy->name($dog_name);

is($dogy->name, $dog_name, "we named the dog $dog_name"); 

