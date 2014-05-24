class people::calorie::packages {
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
    ]:
  }

  # hg
  exec { 'pip install mercurial':
    creates => "${boxen::config::homebrewdir}/share/python/hg"
  }
}
