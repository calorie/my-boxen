class people::calorie::mercurial {
  file { "/Users/${::boxen_user}/.hgrc":
    ensure  => present,
    replace => false,
    content => "[web]\ncacerts = ${boxen::config::homebrewdir}/etc/openssl/cert.pem",
    require => [Package['mercurial'], Package['openssl']]
  }
}
