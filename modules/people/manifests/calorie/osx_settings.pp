class people::calorie::osx_settings {
  # include osx::finder::show_hidden_files

  boxen::osx_defaults { 'Activating Dock auto-hide':
    user   => $::luser,
    domain => 'com.apple.dock',
    key    => 'autohide',
    type   => 'int',
    value  => 1,
  }

  boxen::osx_defaults { 'Disable natural (touchscreen-style) scrolling':
    user   => $::luser,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.swipescrolldirection',
    type   => 'bool',
    value  => true,
  }

  boxen::osx_defaults { 'Enable tap to click on a Magic Trackpad':
    user   => $::luser,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'Clicking',
    type   => 'bool',
    value  => true,
  }

  $tapBehavior = $dragging ? {
    true    => 2,
    default => 1
  }

  boxen::osx_defaults { 'Enable tap to click for the active user':
    user   => $::luser,
    host   => 'currentHost',
    domain => 'NSGlobalDomain',
    key    => 'com.apple.mouse.tapBehavior',
    type   => 'int',
    value  => $tapBehavior,
  }

  boxen::osx_defaults { 'Enable tap to click on the login screen':
    user   => $::luser,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.mouse.tapBehavior',
    type   => 'int',
    value  => $tapBehavior,
  }

  boxen::osx_defaults { 'Show remaining battery percentage':
    user   => $::luser,
    domain => 'com.apple.menuextra.battery',
    key    => 'ShowPercent',
    type   => 'string',
    value  => 'YES',
  }

  boxen::osx_defaults { 'Save screenshots to the desktop':
    user   => $::luser,
    domain => 'com.apple.screencapture',
    key    => 'location',
    type   => 'string',
    value  => '~/Desktop',
  }
}
