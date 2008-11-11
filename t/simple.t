#!/usr/bin/env perl

use lib 't/lib';
use strict;
use warnings;
use Test::More;

use Animal;

plan tests => 1;

# Test basic Animal accessors;
my $dogy = Animal->new;

ok( $dogy->can("name") );
