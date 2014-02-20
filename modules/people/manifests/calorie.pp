class people::calorie {
  include iterm2::stable
  include mysql
  include postgresql
  include imagemagick
  include libtool
  include zsh
  include python
  include pkgconfig
  include java
  include heroku
  include memcached

  include people::calorie::pkg
  include people::calorie::osx_settings
  include people::calorie::application
  include people::calorie::ruby
  include people::calorie::nodejs
  include people::calorie::vichrome
  include people::calorie::dotfiles

  # include projects::hpcss

  $home = "/Users/${::luser}"
  $work = "${home}/work"

  file { $work: ensure => 'directory' }
}
