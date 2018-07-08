class people::calorie::python(
) {
  exec { 'postinstall python3':
    command     => 'brew postinstall python3',
    subscribe   => [Package['python3']],
    refreshonly => true,
    require     => [Package['python3']],
  }
  exec { 'pip3 install neovim':
    command     => 'pip3 install neovim',
    subscribe   => [Package['neovim'], Package['python3'], Exec['postinstall python3']],
    refreshonly => true,
    require     => [Package['neovim'], Package['python3'], Exec['postinstall python3']],
  }
}
