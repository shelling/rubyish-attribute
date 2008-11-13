use strict;
use warnings;

use Test::More;

use lib 't/lib';
use Animal;

plan tests => 2;

# There is writer, no reader;
my $dog_name = "rock";
my $dog_color = 'black';
my $dog_type = "unknown";

my $dogy = Animal->new({
    name => $dog_name,
    color => $dog_color,
    type => $dog_type,
});

not ok($dogy->can("type"), "There is no reader 'type'");
isnt($dogy->type, $dog_type, "There is no reader here.");

