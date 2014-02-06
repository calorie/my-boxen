class people::calorie::vichrome {
  $vichrome = "${boxen::config::srcdir}/vichrome"

  repository { $vichrome:
    source  => 'calorie/ViChrome'
  }

  exec { 'make':
    cwd     => $vichrome,
    creates => "${vichrome}/vichrome.js",
    require => [Repository[$vichrome], Nodejs::Module['coffee-script']]
  }
}
