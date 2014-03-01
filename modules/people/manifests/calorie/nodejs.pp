class people::calorie::nodejs {
  $nodejs_global = 'v0.10'

  class { 'nodejs::global': version => $nodejs_global }

  $global_modules = ['coffee-script', 'grunt-cli']

  # coffeescript
  nodejs::module { $global_modules:
    node_version => $nodejs_global
  }
}
