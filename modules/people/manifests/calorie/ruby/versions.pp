define people::calorie::ruby::versions($version = $title) {
  ruby::version { $version: }

  # install default gems
  $default_gems_path    = "${boxen::config::home}/rbenv/default-gems"
  $default_gems         = hiera_array('people::calorie::ruby::default_gems', [])
  $default_gems_content = join($default_gems, "\n")

  file { $default_gems_path:
    ensure  => present,
    content => $default_gems_content,
    require => [Ruby::Version[$version]],
  }

  people::calorie::ruby::gems { $default_gems:
    ruby_version => $version
  }
}
