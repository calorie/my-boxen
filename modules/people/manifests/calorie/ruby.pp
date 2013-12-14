class people::calorie::ruby {
  $ruby_configure_opts = "--with-openssl-dir=${boxen::config::homebrewdir}/opt/openssl --enable-shared --with-readline-dir=${boxen::config::homebrewdir}/opt/readline"
  $ruby_env = {
    'CONFIGURE_OPTS'      => $ruby_configure_opts,
    'RUBY_CONFIGURE_OPTS' => $ruby_configure_opts
  }

  # install ruby
  define install_rubies ($version = $title, $env) {
    ruby::version { $version:
      env => $env
    }
  }
  install_rubies {
    [
      '1.9.3-p484',
      '2.0.0-p353'
    ]:
    env => $ruby_env
  }
}
