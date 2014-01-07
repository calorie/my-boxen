class people::calorie::application {
  include chrome
  include firefox
  include alfred
  include skype
  include appcleaner
  include hipchat
  include dropbox
  include evernote
  include jumpcut
  include flux
  include keyremap4macbook
  include keyremap4macbook::login_item
  include teamviewer

  include people::calorie::login_items

  # google japanese input
  package { 'GoogleJapaneseInput':
    source   => 'http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg',
    provider => pkgdmg;
  }

  # macvim
  package { 'macvim':
    ensure => installed,
    install_options => [
      '--with-cscope',
      '--with-lua',
    ];
  }

  # keyremap4macbook
  keyremap4macbook::private_xml{ 'private.xml':
    source => "${boxen::config::repodir}/modules/people/manifests/calorie/private.xml"
  }
}
