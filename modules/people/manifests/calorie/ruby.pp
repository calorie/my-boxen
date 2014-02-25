class people::calorie::ruby {
  require openssl
  package { ['readline']: }

  $rubies = ['1.9.3-p545', '2.0.0-p451', '2.1.1']
  $global_version = '2.1.1'

  # install ruby
  define install_rubies ($version = $title) {
    $ruby_configure_opts = "--enable-shared --with-openssl-dir=${boxen::config::homebrewdir}/opt/openssl --with-readline-dir=${boxen::config::homebrewdir}/opt/readline"
    $ruby_env = {
      'LDFLAGS'             => '-L/opt/X11/lib',
      'RUBY_CONFIGURE_OPTS' => $ruby_configure_opts,
      'CONFIGURE_OPTS'      => $ruby_configure_opts,
    }
    ruby::version { $version:
      env => $ruby_env
    }
    ruby::gem { "rake for ${version}":
      gem  => 'rake',
      ruby => $version,
    }
    ruby::gem { "rubygems-update for ${version}":
      gem  => 'rubygems-update',
      ruby => $version,
    }
    ruby::gem { "pry for ${version}":
      gem  => 'pry',
      ruby => $version,
    }
    ruby::gem { "tmuxinator for ${version}":
      gem  => 'tmuxinator',
      ruby => $version,
    }
    ruby::gem { "vvm-rb for ${version}":
      gem  => 'vvm-rb',
      ruby => $version,
    }
    ruby::gem { "refe2 for ${version}":
      gem  => 'refe2',
      ruby => $version,
    }
  }
  install_rubies { $rubies: }

  # rbenv global
  file { "${boxen::config::home}/rbenv/version":
    ensure  => present,
    owner   => $::luser,
    mode    => '0644',
    content => "${global_version}\n",
  }

  exec { 'init refe2 database':
    command  => "env -i zsh -c 'source ${boxen::config::home}/env.sh && RBENV_VERSION=${global_version} bitclust setup --versions=1.9.3,2.0.0,2.1.0'",
    creates  => "/Users/${::luser}/.bitclust",
    provider => 'shell',
    require  => [ Ruby::Gem["refe2 for ${global_version}"], Package['zsh'] ]
  }
}
