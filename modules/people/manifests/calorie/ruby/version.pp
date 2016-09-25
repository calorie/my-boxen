define people::calorie::ruby::version($version = $title) {
  ruby::version { $version: }

  # install default gems
  $default_gems_path    = "${boxen::config::home}/rbenv/default-gems"
  $default_gems         = hiera_array('people::calorie::ruby::default_gems', [])
  $default_gems_content = join($default_gems, "\n")

  file { $default_gems_path:
    content => $default_gems_content
  }

  people::calorie::ruby::gem { $default_gems:
    ruby_version => $version
  }
}
