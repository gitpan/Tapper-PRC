
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Tapper - Program run control for test program automation",
  "AUTHOR" => "AMD OSRC Tapper Team <tapper\@amd64.org>",
  "BUILD_REQUIRES" => {
    "Cwd" => 0,
    "Data::Dumper" => 0,
    "Tapper::Config" => 0,
    "Test::Deep" => 0,
    "Test::MockModule" => 0,
    "Test::More" => 0,
    "Try::Tiny" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Tapper-PRC",
  "EXE_FILES" => [
    "bin/tapper-automatic-test.pl",
    "bin/tapper-client"
  ],
  "LICENSE" => "open_source",
  "NAME" => "Tapper::PRC",
  "PREREQ_PM" => {
    "English" => 0,
    "File::Basename" => 0,
    "File::Copy" => 0,
    "File::Temp" => 0,
    "IO::Handle" => 0,
    "IO::Socket::INET" => 0,
    "IPC::Open3" => 0,
    "Log::Log4perl" => 0,
    "Moose" => 0,
    "MooseX::Log::Log4perl" => 0,
    "Sys::Hostname" => 0,
    "Tapper::Base" => 0,
    "Tapper::Installer::Base" => 0,
    "Tapper::Remote::Config" => 0,
    "Tapper::Remote::Net" => 0,
    "URI::Escape" => 0,
    "YAML" => 0,
    "YAML::Syck" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "4.1.2",
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



