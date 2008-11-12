=head1 NAME
    Rubyish::Attribute - provide ruby-like accessor builder: attr_accessor, attr_writer and attr_reader.
=cut
package Rubyish::Attribute;

use Sub::Exporter;
Sub::Exporter::setup_exporter({ 
    exports => [ qw(attr_accessor attr_writer attr_reader) ] ,
    groups  => { defaults => [ qw(attr_accessor attr_writer attr_reader) ] },
});


=head1 VERSION
    version 0.01
=cut
our $VERSION = "0.01";

=head1 SYNOPSIS
    #!/usr/bin/env perl
   
    use 5.010;

    use strict;
    use warnings;

    {
        package Animal;
        
        use Rubyish::Attribute qw(:all); # use :all to import attr_accessor, attr_writer and attr_reader

        attr_accessor( [qw(name color type)] ); # pass a arrayref as the only one parameter
        # now we have the getter double as setter
        # named as name, color and type

        # then create a constructer based on hashref
        sub new {
            $class = shift;
            bless {}, $class;
        }

        1;
    }
   
    # because all setter return instance itself
    # now we can manipulate object in ruby way more than ruby
    $dogy = Animal->new()->name("rock")->color("black")->type("unknown");

    # use reader to access instance data
    say $dogy->name();  # rock
    say $dogy->color(); # black
    say $dogy->type();  # unknown
=cut

=head1 FUNCTION
    
=cut

=head2 attr_accessor

=cut
sub attr_accessor {
    no strict;
    my $methods = shift;
    my $class = (caller)[0];

    my $make_accessor = sub {
        my $field = shift;
        return sub {
            my ($self, $arg) = @_;
            if ($arg) {
                $self->{$field} = $arg;
                $self;
            } else {
                $self->{$field};
            }
        }
    };

    for $field (@$methods) {
        *{$class . "::" . $field} = $make_accessor->($field);
    }
}

=head2 attr_reader
    attr_reader create only getter for the class you call it
    If we call attr_reader([qw(name)]) in Animal package
    $dogy = Animal->new({name => "rock"})
    $dogy->name()       # rock
    $dogy->name("jack") # cause an exception.
=cut
sub attr_reader {
    no strict;
    my $methods = shift;
    my $class = (caller)[0];

    my $make_reader = sub {
        my $field = shift;
        return sub {
            my $self = shift;
            $self->{$field};
        }
    };
    
    for $field (@$methods) {
        *{$class . "::" . $field} = $make_reader->($field);
    }
}

=head2 attr_writer
    attr_writer create only setter for the class you call it.
    If we call attr_writer([qw(name)]) in Animal package,
    $dogy = Animal->new({name => "rock"}) # initialize
    $dogy->name("jack") # rename it and get the callback itself 
    $dogy->name         # undef
=cut
sub attr_writer {
    no strict;
    my $methods = shift;
    my $class = (caller)[0];

    my $make_writer = sub {
        my $field = shift;

        return sub {
            my ($self, $arg) = @_;
            if ($arg) {
                $self->{$field} = $arg;
                $self;
            } else {            # return undef because no reader 
                return undef;
            }
        }
    };

    for $field (@$methods) {
        *{$class . "::" . $field} = $make_writer->($field);
    }
}

=head1 SEE ALSO
    autobox::Core
    List::Rubyish

=head1 AUTHOR
    shelling <navyblueshellingford at gmail.com>
    gugod    <gugod at gugod.org>

=head2 acknowledgement
    Thanks to gugod providing testing script and leading me on the way of perl

=head1 REPOSITORY
    host:       http://github.com/shelling/rubyish-attribute/tree/master
    checkout:   git clone git://github.com/shelling/rubyish-attribute.git

=head1 BUGS
    please report bugs to <shelling at cpan.org> or <gugod at gugod.org>
=cut
1;
