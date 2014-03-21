class people::calorie::nodejs {
  $nodejs_global = 'v0.10'

  class { 'nodejs::global': version => $nodejs_global }

  $global_modules = ['coffee-script']

  # global modules
  nodejs::module { $global_modules:
    node_version => $nodejs_global
  }
}
