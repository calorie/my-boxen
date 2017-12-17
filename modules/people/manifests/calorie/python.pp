class people::calorie::python(
) {
  exec { 'pip3 install neovim':
    command  => 'pip3 install neovim',
    require  => [Package['neovim'], Package['python3']],
  }
}
