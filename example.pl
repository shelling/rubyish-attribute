#!/usr/bin/env perl

use 5.010;

use warnings;
use strict;


use lib 'lib';

{
    package Animal;

    use Data::Dumper;
    use self;
    use Rubyish::Attribute;
    
    attr_accessor( [qw(name)] );
    attr_writer( [qw(age)] );
    attr_reader( [qw(color)] );

    sub new {
        my ($class, $args) = @_;
        my $self = bless {}, $class;
        for (keys %$args) { $self->{$_} = $args->{$_} }
        $self;
    }

    sub inspect { print Dumper(self) }

    sub add_attr_accessor {
        attr_accessor($_[1]);
        self;
    }

    1;
}

my $dogy = Animal->new({
    name  => "lucky",
    age   => 1,
    color => "white",
});

say "=== simple ===";

say $dogy->age; #=>  undef (with warn msg)
$dogy->age(2)->inspect;

say "\n****************************************";

say $dogy->color; #=> white
$dogy->color("black"); # undef (with warn msg)

say "\n****************************************";

say $dogy->name; #=> lucky
$dogy->name("jack")->inspect; 

say "\n=== meta programming ===";

$dogy->add_attr_accessor([qw(master)]);
$dogy->master("shelling")->inspect;

say "\n****************************************";

