class people::calorie::ruby(
  $vvmopts = []
) {
  include openssl
  package {
    [
      'readline',
      'libyaml',
      'libffi'
    ]:
  }

  $rubies         = keys(hiera_hash('ruby::version::env', {}))
  $global_version = hiera('ruby::global::version', 'system')
  $vvm_rb_options = join($vvmopts, ' ')
  $gem_env        = "source ${boxen::config::home}/env.sh && RBENV_VERSION=${global_version} rbenv exec"

  # install ruby
  people::calorie::ruby::versions { $rubies: }

  # init vvm-rb
  exec { 'init vvm-rb':
    command  => "env -i SHELL=${boxen::config::homebrewdir}/bin/zsh zsh -c '${gem_env} vvm install latest ${vvm_rb_options}'",
    provider => 'shell',
    creates  => "/Users/${::boxen_user}/.vvm-rb",
    timeout  => 1800,
    require  => [Ruby::Version[$global_version], Ruby_Gem["vvm-rb for ${global_version}"], Package['zsh'], Class['people::calorie::mercurial']],
  }

  # init refe2
  exec { 'init refe2 database':
    command  => "env -i SHELL=${boxen::config::homebrewdir}/bin/zsh zsh -c '${gem_env} bitclust setup --versions=2.3.0'",
    provider => 'shell',
    creates  => "/Users/${::boxen_user}/.bitclust",
    require  => [Ruby::Version[$global_version], Ruby_Gem["refe2 for ${global_version}"], Package['zsh']],
  }

  # nokogiri
  package {
    [
      'libxml2',
      'libxslt',
      'libiconv',
    ]:
  }
  exec { 'bundle config nokogiri':
    command     => "env -i SHELL=${boxen::config::homebrewdir}/bin/zsh zsh -c '${gem_env} bundle config --global build.nokogiri --use-system-libraries --with-iconv-dir=${boxen::config::homebrewdir}/opt/libiconv --with-xml2-dir=${boxen::config::homebrewdir}/opt/libxml2 --with-xslt-dir=${boxen::config::homebrewdir}/opt/libxslt'",
    provider    => 'shell',
    subscribe   => [Ruby::Version[$global_version], Package['libxml2'], Package['libxslt'], Package['libiconv']],
    refreshonly => true,
    require     => [Ruby::Version[$global_version], Package['libxml2'], Package['libxslt'], Package['libiconv']],
  }
}
