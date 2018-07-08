class people::calorie::nodejs(
  $nodejs_global  = '0.10',
  $global_modules = ['coffee-script'],
) {

  unless defined(Nodejs::Version[$nodejs_global]) {
    nodejs::version { $nodejs_global: }
  }

  class { 'nodejs::global': version => $nodejs_global }

  people::calorie::nodejs::npm_module { $global_modules:
    node_version => $nodejs_global,
  }
}
