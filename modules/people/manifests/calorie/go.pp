class people::calorie::go(
  $versions       = ['1.1.2'],
  $global_version = '1.1.2'
) {
  include go

  go::version { $versions: }

  # global
  file { "${boxen::config::home}/chgo/version":
    content => "${global_version}\n",
    replace => true,
    require => [Go::Version[$global_version]],
  }
}
