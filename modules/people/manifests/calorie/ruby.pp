class people::calorie::ruby(
  $vvmopts = []
) {
  package { ['readline']: }

  $rubies         = keys(hiera_hash('ruby::version::env', {}))
  $global_version = hiera('ruby::global::version', 'system')
  $vvm_rb_options = join($vvmopts, ' ')
  $gem_env        = "source ${boxen::config::home}/env.sh && RBENV_VERSION=${global_version}"

  # install ruby
  people::calorie::ruby::install { $rubies: }

  # init vvm-rb
  exec { 'init vvm-rb':
    command  => "env -i zsh -c '${gem_env} vvm install latest ${vvm_rb_options}'",
    creates  => "/Users/${::boxen_user}/.vvm-rb",
    provider => 'shell',
    timeout  => 1800,
    require  => [Exec["Install default-gems for ${global_version}"], Package['zsh'], Class['people::calorie::mercurial']],
  }

  # init refe2
  exec { 'init refe2 database':
    command  => "env -i zsh -c '${gem_env} bitclust setup --versions=2.3.0'",
    creates  => "/Users/${::boxen_user}/.bitclust",
    provider => 'shell',
    require  => [Exec["Install default-gems for ${global_version}"], Package['zsh']],
  }

  # nokogiri
  package {
    [
      'libxml2',
      'libxslt',
      'libiconv',
    ]:
  }
  # exec { 'brew link libxml2 libxslt libiconv':
  #   command     => 'brew link --force libxml2 libxslt libiconv',
  #   provider    => 'shell',
  #   subscribe   => [Package['libxml2'], Package['libxslt']],
  #   refreshonly => true,
  #   require     => [Package['libxml2'], Package['libxslt']],
  # }
  exec { 'bundle config nokogiri':
    command     => "env -i zsh -c '${gem_env} bundle config --global build.nokogiri --use-system-libraries --with-iconv-dir=${boxen::config::homebrewdir}/opt/libiconv --with-xml2-dir=${boxen::config::homebrewdir}/opt/libxml2 --with-xslt-dir=${boxen::config::homebrewdir}/opt/libxslt'",
    provider    => 'shell',
    subscribe   => [Package['libxml2'], Package['libxslt'], Package['libiconv']],
    refreshonly => true,
    require     => [Package['libxml2'], Package['libxslt'], Package['libiconv']],
  }
  # exec { 'brew unlink libxml2 libxslt libiconv':
  #   command     => 'brew unlink libxml2 libxslt libiconv',
  #   provider    => 'shell',
  #   subscribe   => [Package['libxml2'], Package['libxslt']],
  #   refreshonly => true,
  #   require     => [Package['libxml2'], Package['libxslt']],
  # }
}
