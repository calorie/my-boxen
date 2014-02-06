class people::calorie::dotfiles {
  $home     = "/Users/${::luser}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => 'calorie/dotfiles'
  }

  exec { "echo y|${dotfiles}/setup.sh":
    cwd     => $dotfiles,
    creates => "${home}/.vimrc",
    require => [Repository[$dotfiles], Class['people::calorie::pkg']]
  }

  Git::Config::Global <| title == 'core.excludesfile' |> {
    value => '~/.gitignore'
  }
}
