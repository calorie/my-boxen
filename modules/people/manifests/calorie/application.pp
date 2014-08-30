class people::calorie::application {
  include chrome
  include firefox
  include alfred
  include skype
  include appcleaner
  include dropbox
  include evernote
  include jumpcut
  include flux
  include karabiner
  include karabiner::login_item
  include teamviewer
  include virtualbox
  include vagrant
  include caffeine
  include better_touch_tools
  include vlc

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
  karabiner::private_xml{ 'private.xml':
    source => "${boxen::config::repodir}/modules/people/manifests/calorie/private.xml"
  }
  karabiner::exec { 'set repeat.initial_wait 250':
    unless => 'repeat.initial_wait=250'
  }
  karabiner::exec { 'set repeat.wait 30':
    unless => 'repeat.wait=30'
  }

  # vagrant
  vagrant::plugin {
    [
      'vagrant-omnibus',
    ]:
  }
}
