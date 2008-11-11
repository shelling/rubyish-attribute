

=head1 NAME
    autobox::Accessor - this provide ruby-like accessor builder: attr_accessor, attr_writer and attr_reader.
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
    package Animal;
    
    use Rubyish::Attribute qw(:all);

    attr_accessor( [qw(name address jobs resume)] )

    1;
=cut

=head1 FUNCTION


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

=head1 AUTHOR
    shelling <navyblueshellingford at gmail.com>
=cut

=head1 BUGS
    please report bugs to shelling at cpan.org
=cut
1;
