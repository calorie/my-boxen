include homebrew

class people::calorie::packages {
  homebrew::tap {
    [
      'peco/peco',
    ]:
  }

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
      'nkf',
      'ssh-copy-id',
      'peco',
      'direnv',
    ]:
  }

  # hg
  package { 'mercurial':
    require => Package['docutils'],
  }
  package { 'docutils':
    ensure   => installed,
    provider => pip,
  }
}
