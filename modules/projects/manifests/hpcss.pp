class projects::hpcss {
  package { 'mpich2':
    ensure => installed,
    install_options => [
      '--enable-shared',
      '--disable-fortran',
    ];
  }

  $hpcss = "/Users/${::boxen_user}/work/hpcss"

  file { $hpcss:
    ensure => 'directory',
  }

  repository { "${hpcss}/mpispec":
    source  => 'calorie/mpispec'
  }
}
