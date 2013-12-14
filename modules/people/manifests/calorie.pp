class people::calorie {
  include iterm2::stable
  include mysql
  include imagemagick
  include libtool
  include zsh
  include python
  include pkgconfig
  include java

  include people::calorie::application
  include people::calorie::ruby

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
  $calorie  = "${boxen::config::repodir}/modules/people/manifests/calorie"

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

  # osx settings
  exec { "osx-settings":
    cwd => $calorie,
    creates => "${home}/.vimrc",
    command => "sh ${calorie}/osx -s"
  }
}
