class people::calorie::perl(
  $version = '5.21.4'
) {
  include perl

  class { 'perl::global': version => $version }

  perl::version { $version: }

  # perl::cpanm { "App::pmuninstall for ${version}":
  #   module => 'App::pmuninstall',
  #   perl   => $version
  # }
  # perl::cpanm { "App::cpanoutdated for ${version}":
  #   module => 'App::cpanoutdated',
  #   perl   => $version
  # }
}
