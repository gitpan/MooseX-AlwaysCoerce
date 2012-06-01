
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Automatically enable coercions for Moose attributes",
  "AUTHOR" => "Rafael Kitover <rkitover\@cpan.org>, Michael G. Schwern <mschwern\@cpan.org>, Karen Etheridge <ether\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Test::CheckDeps" => "0.002",
    "Test::Fatal" => 0,
    "Test::More" => "0.88",
    "Test::NoWarnings" => "1.04"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooseX-AlwaysCoerce",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooseX::AlwaysCoerce",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Moose" => 0,
    "MooseX::ClassAttribute" => "0.24",
    "Package::Stash" => "0.26",
    "namespace::autoclean" => "0.12"
  },
  "VERSION" => "0.17",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



