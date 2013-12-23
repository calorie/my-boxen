class projects::hpcss {
  package { 'mpich2':
    ensure => installed,
    install_options => [
      '--enable-shared',
    ];
  }

  $hpcss = "/Users/${::luser}/work/hpcss"

  file { $hpcss:
    ensure => 'directory',
  }

  repository { "${hpcss}/mpispec":
    source  => 'calorie/mpispec'
  }
}
