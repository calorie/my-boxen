class people::calorie::ruby {
  require openssl

  package { ['readline']: }

  $rubies = ['1.9.3-p484', '2.0.0-p353']
  $global_version = '2.0.0-p353'

  # install ruby
  define install_rubies ($version = $title) {
    $ruby_configure_opts = "--enable-shared --with-openssl-dir=${boxen::config::homebrewdir}/opt/openssl --with-readline-dir=${boxen::config::homebrewdir}/opt/readline"
    $ruby_env = {
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
  }
  install_rubies { $rubies: }

  # rbenv global
  file { "${boxen::config::home}/rbenv/version":
    ensure  => present,
    owner   => $::luser,
    mode    => '0644',
    content => "${global_version}\n",
  }

  # vvm-rb
  exec { 'vvm-rb for system':
    command  => "env -i zsh -c 'source ${boxen::config::home}/env.sh && RBENV_VERSION=system gem install vvm-rb'",
    creates  => "/Users/${::luser}/.vvm-rb",
    provider => 'shell',
    user     => 'root',
    require  => [ Package['zsh'] ]
  }
  exec { 'install latest vim':
    command  => "env -i zsh -c 'source ${boxen::config::home}/env.sh && RBENV_VERSION=system vvm-rb install --use latest --enable-multibyte --with-features=huge --enable-fontset --disable-selinux --enable-pythoninterp --enable-rubyinterp --enable-xim --enable-luainterp --with-lua-prefix=${boxen::config::homebrewdir}'",
    creates  => "/Users/${::luser}/.vvm-rb",
    provider => 'shell',
    require  => [ Exec['vvm-rb for system'], Package['zsh'] ]
  }
  # exec { 'update vvm-rb':
  #   command  => "env -i zsh -c 'source ${boxen::config::home}/env.sh && RBENV_VERSION=system gem update vvm-rb && RBENV_VERSION=system gem cleanup'",
  #   onlyif   => "test -d /Users/${::luser}/.vvm-rb",
  #   provider => 'shell',
  #   user     => 'root',
  #   require  => [ Package['zsh'] ]
  # }
}
