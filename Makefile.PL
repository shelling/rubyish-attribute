# use 5.010000;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Rubyish::Attribute',
    VERSION_FROM      => 'lib/Rubyish/Attribute.pm', # finds $VERSION
    ABSTRACT_FROM     => 'lib/Rubyish/Attribute.pm',
    AUTHOR            => 'shelling, <navyblueshellingford@gmail.com>',
    PREREQ_PM         => {
            'Test::More'    => 0,
            'Sub::Exporter' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Rubyish-Attribute-*' },
);
