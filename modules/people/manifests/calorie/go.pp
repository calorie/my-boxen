class people::calorie::go {
  include go

  $versions = ['1.1.2']
  $global_version = '1.1.2'

  go::version { $versions: }

  # global
  file { "${boxen::config::home}/goenv/version":
    content => "${global_version}\n",
    replace => true,
  }
}