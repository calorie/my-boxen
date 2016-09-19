class people::calorie::dotfiles {
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => 'calorie/dotfiles'
  }

  exec { "echo y|${dotfiles}/script/setup":
    cwd     => $dotfiles,
    creates => "${home}/.vimrc",
    require => [Repository[$dotfiles], Class['boxen::personal']],
  }

  Git::Config::Global<| title == 'core.excludesfile' |> {
    value => '~/.gitignore'
  }
}
