package Animal;
use Rubyish::Attribute;

attr_accessor "name";

sub new {
    my ($class) = @_;
    return bless {}, $class;
}

1;

