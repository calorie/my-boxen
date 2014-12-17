class people::calorie::nodejs {
  $nodejs_global = 'v0.10'

  unless defined(Nodejs::Version[$nodejs_global]) {
    nodejs::version { $nodejs_global: }
  }

  class { 'nodejs::global': version => $nodejs_global }

  $global_modules = ['coffee-script']

  # global modules
  nodejs::module { $global_modules:
    node_version => $nodejs_global
  }
}
