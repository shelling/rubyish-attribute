package Animal;
use Rubyish::Attribute qw(:all);

attr_accessor qw(name);
attr_reader qw(color);
attr_writer qw(type);

sub new {
    my ($class, $args) = @_;
    my $self = bless {}, $class;
    for (keys %$args) {
        $self->{$_} = $args->{$_};
    }
    $self;
}

1;

