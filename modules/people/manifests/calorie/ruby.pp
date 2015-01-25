class people::calorie::ruby(
  $vvmopts = []
) {
  require openssl
  package { ['readline']: }

  $rubies = keys(hiera_hash('ruby::version::env', {}))
  $global_version = hiera('ruby::global_version', 'system')
  $vvm_rb_options = join($vvmopts, ' ')
  $gem_env = "source ${boxen::config::home}/env.sh && RBENV_VERSION=${global_version}"

  # install ruby
  people::calorie::ruby::install { $rubies: }

  # rbenv global
  file { "${boxen::config::home}/rbenv/version":
    ensure  => present,
    owner   => $::luser,
    mode    => '0644',
    content => "${global_version}\n",
  }

  # init vvm-rb
  exec { 'init vvm-rb':
    command  => "env -i zsh -c '${gem_env} vvm-rb install latest ${vvm_rb_options}'",
    creates  => "/Users/${::luser}/.vvm-rb",
    provider => 'shell',
    require  => [ Exec["Install default-gems for ${global_version}"], Package['zsh'] ]
  }

  # init refe2
  exec { 'init refe2 database':
    command  => "env -i zsh -c '${gem_env} bitclust setup --versions=1.9.3,2.0.0,2.1.0'",
    creates  => "/Users/${::luser}/.bitclust",
    provider => 'shell',
    require  => [ Exec["Install default-gems for ${global_version}"], Package['zsh'] ]
  }

  # nokogiri
  homebrew::tap { ['homebrew/dupes']: }
  package {
    [
      'libxml2',
      'libxslt',
      'libiconv',
    ]:
  }
  exec { 'brew link libxml2 libxslt libiconv':
    command     => 'brew link --force libxml2 libxslt libiconv',
    provider    => 'shell',
    subscribe   => [ Package['libxml2'], Package['libxslt'] ],
    refreshonly => true,
    require     => [ Package['libxml2'], Package['libxslt'] ]
  }
  exec { 'bundle config nokogiri':
    command     => "env -i zsh -c 'source ${boxen::config::home}/env.sh && RBENV_VERSION=${global_version} bundle config --global build.nokogiri --use-system-libraries --with-iconv-dir=$(brew --prefix libiconv) --with-xml2-dir=$(brew --prefix libxml2) --with-xslt-dir=$(brew --prefix libxslt)'",
    provider    => 'shell',
    subscribe   => [ Package['libxml2'], Package['libxslt'], Package['libiconv'] ],
    refreshonly => true,
    require     => [ Package['libxml2'], Package['libxslt'], Package['libiconv'] ]
  }
  exec { 'brew unlink libxml2 libxslt libiconv':
    command     => 'brew unlink libxml2 libxslt libiconv',
    provider    => 'shell',
    subscribe   => [ Package['libxml2'], Package['libxslt'] ],
    refreshonly => true,
    require     => [ Package['libxml2'], Package['libxslt'] ]
  }
}
