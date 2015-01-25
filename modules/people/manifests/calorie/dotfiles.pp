class people::calorie::dotfiles {
  $home     = "/Users/${::luser}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => 'calorie/dotfiles'
  }

  exec { "echo y|${dotfiles}/script/setup":
    cwd     => $dotfiles,
    creates => "${home}/.vimrc",
    require => [Repository[$dotfiles], Class['people::calorie::packages']]
  }

  Git::Config::Global <| title == 'core.excludesfile' |> {
    value => '~/.gitignore'
  }
}
