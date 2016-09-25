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

  # install ruby
  people::calorie::ruby::versions { $rubies: }

  # init vvm-rb
  exec { 'init vvm-rb':
    command  => "/opt/rubies/${global_version}/bin/vvm install latest ${vvm_rb_options}",
    creates  => "/Users/${::boxen_user}/.vvm-rb",
    timeout  => 1800,
    require  => [Ruby_Gem["vvm-rb for ${global_version}"], Class['people::calorie::mercurial']],
  }

  # init refe2
  exec { 'init refe2 database':
    command  => "/opt/rubies/${global_version}/bin/bitclust setup --versions=2.3.0",
    creates  => "/Users/${::boxen_user}/.bitclust",
    require  => [Ruby_Gem["refe2 for ${global_version}"]],
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
    command     => "/opt/rubies/${global_version}/bin/bundle config --global build.nokogiri --use-system-libraries --with-iconv-dir=${boxen::config::homebrewdir}/opt/libiconv --with-xml2-dir=${boxen::config::homebrewdir}/opt/libxml2 --with-xslt-dir=${boxen::config::homebrewdir}/opt/libxslt",
    provider    => 'shell',
    subscribe   => [Package['libxml2'], Package['libxslt'], Package['libiconv']],
    refreshonly => true,
    require     => [Package['libxml2'], Package['libxslt'], Package['libiconv']],
  }
}
