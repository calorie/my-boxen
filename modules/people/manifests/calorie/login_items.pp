class people::calorie::login_items {
  osx_login_item { 'Dropbox':
    name => 'Dropbox',
    path => '/Applications/Dropbox.app',
    hidden => true,
    require => Package['Dropbox'],
  }

  osx_login_item { 'Alfred 2':
    name => 'Alfred 2',
    path => '/Applications/Alfred 2.app',
    hidden => true,
    require => Class['alfred'],
  }

  osx_login_item { 'Jumpcut':
    name => 'Jumpcut',
    path => '/Applications/Jumpcut.app',
    hidden => true,
    require => Class['jumpcut'],
  }

  osx_login_item { 'Flux':
    name => 'Flux',
    path => '/Applications/Flux.app',
    hidden => true,
    require => Class['flux'],
  }

  osx_login_item { 'Caffeine':
    name => 'Caffeine',
    path => '/Applications/Caffeine.app',
    hidden => true,
    require => Class['caffeine'],
  }

  osx_login_item { 'SizeUp':
    name => 'SizeUp',
    path => '/Applications/SizeUp.app',
    hidden => true,
    require => Class['sizeup'],
  }
}
