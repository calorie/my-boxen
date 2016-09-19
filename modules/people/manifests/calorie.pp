class people::calorie {
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
