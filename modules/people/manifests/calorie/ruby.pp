class people::calorie::ruby {
  $ruby_configure_opts = "--with-openssl-dir=${boxen::config::homebrewdir}/opt/openssl --enable-shared --with-readline-dir=${boxen::config::homebrewdir}/opt/readline"
  $ruby_env = {
    'CONFIGURE_OPTS'      => $ruby_configure_opts,
    'RUBY_CONFIGURE_OPTS' => $ruby_configure_opts
  }
  $rubies = ['1.9.3-p484', '2.0.0-p353']
  $global_version = '2.0.0-p353'

  # install ruby
  define install_rubies ($version = $title, $env) {
    ruby::version { $version:
      env => $env
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
  install_rubies { $rubies:
    env => $ruby_env
  }

  # rbenv global
  file { "${boxen::config::home}/rbenv/version":
    ensure  => present,
    owner   => $::luser,
    mode    => '0644',
    content => "${global_version}\n",
  }
}
