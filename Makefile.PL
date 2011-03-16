use inc::Module::Install;

name     'MooseX-AlwaysCoerce';
all_from 'lib/MooseX/AlwaysCoerce.pm';
author   'Rafael Kitover <rkitover@cpan.org>';
license  'perl';

test_requires 'Test::More' => '0.94';
test_requires 'Test::Fatal';
test_requires 'Test::NoWarnings';
test_requires 'Test::Requires';

requires 'Moose';
requires 'namespace::autoclean'     => '0.12';
requires 'MooseX::ClassAttribute'   => '0.24';
requires 'Package::Stash'           => '0.26';

auto_provides;
auto_install;

resources repository =>
    'http://git.shadowcat.co.uk/gitweb/gitweb.cgi?p=gitmo/MooseX-AlwaysCoerce.git';

WriteAll;
