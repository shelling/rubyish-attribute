use strict;
use warnings;

use Test::More;

use lib 't/lib';
use Animal;

plan tests => 2;

# There is reader, no writer.
my $dog_name = "rock";
my $dog_color = 'black';
my $dogy = Animal->new({
    name => $dog_name,
    color => $dog_color,
    type => "unknown",
});

ok($dogy->can("color"), "There is a reader 'color'");
is($dogy->color, $dog_color, "Color of the dog is $dog_color");

