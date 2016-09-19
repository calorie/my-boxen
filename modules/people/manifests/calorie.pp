class people::calorie {
  # dirty way of ensuring that installer can install things
  sudoers { 'installer':
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => [
      '(ALL) SETENV:NOPASSWD: /usr/sbin/installer',
    ],
    type     => 'user_spec',
  }

  include heroku
  include imagemagick
  include iterm2::stable
  include java
  include memcached
  include mysql
  include pkgconfig
  include postgresql
  include python
  include zsh

  include people::calorie::application
  include people::calorie::dotfiles
  include people::calorie::go
  include people::calorie::misc
  include people::calorie::nodejs
  include people::calorie::osx_settings
  include people::calorie::packages
  # include people::calorie::perl
  include people::calorie::ruby
}
