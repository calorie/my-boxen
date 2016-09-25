define people::calorie::ruby::install($version = $title) {
  ruby::version { $version: }

  # default gems
  $default_gems_path    = "${boxen::config::home}/rbenv/default-gems"
  $default_gems         = hiera_array('people::calorie::ruby::default_gems', [])
  $default_gems_content = join($default_gems, "\n")

  file { $default_gems_path:
    content => $default_gems_content
  }

  exec { "Install default-gems for ${version}":
    command     => "env -i bash -c 'source ${boxen::config::home}/env.sh && RBENV_VERSION=${version} rbenv exec gem install `cat ${default_gems_path}`'",
    provider    => 'shell',
    onlyif      => "test -f ${default_gems_path}",
    subscribe   => [Ruby::Version[$version], File[$default_gems_path]],
    refreshonly => true,
    require     => [Ruby::Version[$version], File[$default_gems_path]],
  }
}
