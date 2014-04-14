define people::calorie::ruby::install($version = $title) {
  $default_gems = "${boxen::config::home}/rbenv/default-gems"

  ruby::version { $version: }

  # default gems
  exec { "Install default-gems for ${version}":
    command     => "env -i zsh -c 'source ${boxen::config::home}/env.sh && RBENV_VERSION=${version} rbenv exec gem install `cat ${default_gems}`'",
    provider    => 'shell',
    onlyif      => "test -f ${default_gems}",
    subscribe   => [ Ruby::Version[$version], File[$default_gems] ],
    refreshonly => true,
    require     => [ Ruby::Version[$version], Package['zsh'] ]
  }
}
