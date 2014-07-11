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
  exec { 'pip install mercurial':
    creates => "${boxen::config::homebrewdir}/share/python/hg"
  }
}
