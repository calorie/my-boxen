class people::calorie::ruby {
  require openssl
  package { ['readline']: }

  $rubies = keys(hiera_hash('ruby::version::env', {}))
  $global_version = hiera('ruby::global_version', 'system')

  # install ruby
  people::calorie::ruby::install { $rubies: }

  # rbenv global
  file { "${boxen::config::home}/rbenv/version":
    ensure  => present,
    owner   => $::luser,
    mode    => '0644',
    content => "${global_version}\n",
  }

  # init refe2
  exec { 'init refe2 database':
    command  => "env -i zsh -c 'source ${boxen::config::home}/env.sh && RBENV_VERSION=${global_version} bitclust setup --versions=1.9.3,2.0.0,2.1.0'",
    creates  => "/Users/${::luser}/.bitclust",
    provider => 'shell',
    require  => [ Exec["Install default-gems for ${global_version}"], Package['zsh'] ]
  }
}
