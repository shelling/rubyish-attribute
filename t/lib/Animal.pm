package Animal;
use Rubyish::Attribute qw(:all);

attr_accessor([ qw(name) ]);

sub new {
    my ($class) = @_;
    return bless {}, $class;
}

1;

