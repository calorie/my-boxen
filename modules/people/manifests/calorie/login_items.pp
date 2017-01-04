class people::calorie::login_items {
  osx_login_item { 'Alfred':
    name        => 'Alfred 3',
    path        => '/Applications/Alfred 3.app',
    hidden      => true,
    ensure      => present,
    require     => Package['alfred'],
  }

  osx_login_item { 'BetterTouchTool':
    name        => 'BetterTouchTool',
    path        => '/Applications/BetterTouchTool.app',
    hidden      => true,
    ensure      => present,
    require     => Package['bettertouchtool'],
  }

  osx_login_item { 'Caffeine':
    name        => 'Caffeine',
    path        => '/Applications/Caffeine.app',
    hidden      => true,
    ensure      => present,
    require     => Package['caffeine'],
  }

  osx_login_item { 'Dropbox':
    name        => 'Dropbox',
    path        => '/Applications/Dropbox.app',
    hidden      => true,
    ensure      => present,
    require     => Package['dropbox'],
  }

  # osx_login_item { 'Flux':
  #   name        => 'Flux',
  #   path        => '/Applications/Flux.app',
  #   hidden      => true,
  #   ensure      => present,
  #   require     => Package['flux'],
  # }

  osx_login_item { 'MacID':
    name        => 'MacID',
    path        => '/Applications/MacID.app',
    hidden      => true,
    ensure      => present,
    require     => Package['macid'],
  }
}
