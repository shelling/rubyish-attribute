package Animal;
use Rubyish::Attribute qw(:all);

attr_accessor( [qw(name)] );
attr_reader( [qw(color)] );
attr_writer( [qw(type)] );

sub new {
    my ($class, $args) = @_;
    my $self = bless {}, $class;
    $self->{name} = $args->{name} if $args->{name};
    $self->{color} = $args->{color} if $args->{color};
    $self->{type} = $args->{type} if $args->{type};
    $self;
}

1;

