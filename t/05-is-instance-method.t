use strict;
use warnings;

use lib 't/lib';
use Animal;

use Test::More;

plan tests => 6;


eval    { Animal->name() };
like    $@,                               qr(name),                               $@;
like    $@,                               qr(instance),                           $@;

eval    { Animal->color() };
like    $@,                               qr(color),                              $@;
like    $@,                               qr(instance),                           $@;

eval    { Animal->type() };
like    $@,                               qr(type),                               $@;
like    $@,                               qr(instance),                           $@;
