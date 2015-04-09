include homebrew

class people::calorie::packages {
  homebrew::tap { 'homebrew/dupes': }

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
      'mercurial',
      'homebrew/dupes/grep',
    ]:
  }
}
