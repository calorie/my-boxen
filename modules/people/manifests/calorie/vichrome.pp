class people::calorie::vichrome {
  $vichrome = "${boxen::config::srcdir}/vichrome"

  repository { $vichrome:
    source  => 'calorie/ViChrome'
  }

  exec { 'build vichrome':
    command => "${boxen::config::home}/nodenv/shims/coffee -o . -c coffee/*",
    cwd     => $vichrome,
    creates => "${vichrome}/vichrome.js",
    require => [Repository[$vichrome], Nodejs::Module['coffee-script']]
  }
}
