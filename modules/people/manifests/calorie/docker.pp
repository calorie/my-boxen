class people::calorie::docker {
  package {
    [
      'boot2docker',
      'docker',
    ]:
  }

  exec { 'Init docker':
    command     => 'boot2docker init',
    subscribe   => Package['boot2docker'],
    refreshonly => true,
    require     => Package['boot2docker'],
  }
}
