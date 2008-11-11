#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

use lib 't/lib';
use lib 'lib';
use Animal;

plan tests => 1;

# Test basic Animal accessors;
my $dog_name = "rock";
my $dogy = Animal->new()->name($dog_name);
ok( $dogy->can("name") );
print "we named the dog $dog_name and it now named " . $dogy->name() . "\n";
