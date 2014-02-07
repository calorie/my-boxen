class people::calorie::nodejs {
  $nodejs_global = 'v0.10'

  class { 'nodejs::global': version => $nodejs_global }

  # coffeescript
  nodejs::module { 'coffee-script':
    node_version => $nodejs_global
  }
}
