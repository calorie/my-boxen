class people::calorie::login_items {
  osx_login_item { 'Alfred 2':
    name    => 'Alfred 2',
    path    => '/Applications/Alfred 2.app',
    hidden  => true,
    require => Class['boxen::personal'],
  }

  osx_login_item { 'BetterTouchTool':
    name    => 'BetterTouchTool',
    path    => '/Applications/BetterTouchTool.app',
    hidden  => true,
    require => Class['boxen::personal'],
  }

  osx_login_item { 'Caffeine':
    name    => 'Caffeine',
    path    => '/Applications/Caffeine.app',
    hidden  => true,
    require => Class['boxen::personal'],
  }

  osx_login_item { 'Dropbox':
    name    => 'Dropbox',
    path    => '/Applications/Dropbox.app',
    hidden  => true,
    require => Class['boxen::personal'],
  }

  # osx_login_item { 'Flux':
  #   name    => 'Flux',
  #   path    => '/Applications/Flux.app',
  #   hidden  => true,
  #   require => Class['boxen::personal'],
  # }

  osx_login_item { 'MacID':
    name    => 'MacID',
    path    => '/Applications/MacID.app',
    hidden  => true,
    require => Class['boxen::personal'],
  }
}
