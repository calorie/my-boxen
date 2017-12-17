class people::calorie::python(
) {
  exec { 'pip3 install neovim':
    command     => 'pip3 install neovim',
    subscribe   => [Package['neovim'], Package['python3']],
    refreshonly => true,
    require     => [Package['neovim'], Package['python3']],
  }
}
