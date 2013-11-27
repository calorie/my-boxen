class people::calorie {
  include chrome
  include mysql
  include imagemagick
  include libtool
  include alfred
  include skype
  include zsh
  include iterm2::stable
  include python
  include pkgconfig
  include appcleaner
  include hipchat
  include dropbox
  include java
  include evernote
  include jumpcut
  include flux

  package {
    [
      'wget',
      'tmux',
      'fontforge',
      'ctags',
      'cmake',
      'lua',
      'luajit',
      'reattach-to-user-namespace',
      'the_silver_searcher',
      'rmtrash',
      'tig',
    ]:
  }
  package { 'macvim':
    ensure => installed,
    install_options => [
      '--with-cscope',
      '--with-lua',
    ];
  }

  $home     = "/Users/${::luser}"
  $dotfiles = "${home}/dotfiles"
  $work     = "${home}/work"
  $ruby_env = {
    'RUBY_CONFIGURE_OPTS' => "--with-openssl-dir=${boxen::config::homebrewdir}/opt/openssl --enable-shared --with-readline-dir=${boxen::config::homebrewdir}/opt/readline"
  }
  $ruby_version = '2.0.0-p353'
  $ruby_version_link = '2.0.0'

  # install ruby
  ruby::version { $ruby_version:
    env => $ruby_env
  }
  file { "${boxen::config::home}/rbenv/versions/${ruby_version_link}":
    ensure  => symlink,
    force   => true,
    target  => "${boxen::config::home}/rbenv/versions/${ruby_version}"
  }

  # rbenv global
  exec { "rbenv global ${ruby_version} && rbenv rehash": }
  # class { 'ruby::global': version => $ruby_version_link }

  # default gems
  define default_gems ($gem = $title, $version) {
    ruby::gem { "${gem} for ${version}":
      gem  => $gem,
      ruby => $version,
    }
  }
  default_gems {
    [
      'bundler',
      'rake',
      'rubygems-update',
      'rbenv-rehash',
      'pry',
      'tmuxinator',
      'vvm-rb',
    ]:
    version => $ruby_version_link
  }

  class { 'nodejs::global': version => 'v0.10.21' }

  Git::Config::Global <| title == "core.excludesfile" |> {
    value => "~/.gitignore"
  }

  file { "${work}":
    ensure => "directory",
  }

  # coffeescript
  nodejs::module { 'coffee-script':
    node_version => 'v0.10.21'
  }

  # vichrome
  $vichrome = "${work}/vichrome"
  repository { $vichrome:
    source  => "calorie/ViChrome"
  }
  exec { "make":
    cwd => $vichrome,
    creates => "${vichrome}/vichrome.js",
    require => Repository[$vichrome]
  }

  # hg
  exec { "pip install mercurial":
    creates => "${boxen::config::homebrewdir}/share/python/hg"
  }

  # dotfiles
  repository { $dotfiles:
    source  => "calorie/dotfiles"
  }
  exec { "echo y|${dotfiles}/setup.sh":
    cwd => $dotfiles,
    creates => "${home}/.vimrc",
    require => Repository[$dotfiles]
  }

  # rbenv-binstubs
  ruby::plugin { 'rbenv-binstubs':
    ensure => '1.3',
    source => 'ianheggie/rbenv-binstubs'
  }
}
