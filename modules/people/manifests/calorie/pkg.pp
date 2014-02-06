class people::calorie::pkg {
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
    ]:
  }

  # hg
  exec { 'pip install mercurial':
    creates => "${boxen::config::homebrewdir}/share/python/hg"
  }
}
