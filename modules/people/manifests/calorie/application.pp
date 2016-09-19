class people::calorie::application {
  include karabiner
  include karabiner::login_item

  include people::calorie::login_items

  # macvim
  package { 'macvim':
    ensure          => installed,
    install_options => ['--with-lua'],
    require         => Package['lua'],
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
}
