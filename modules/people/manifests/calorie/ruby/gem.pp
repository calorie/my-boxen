define people::calorie::ruby::gem(
  $gem          = $title,
  $ruby_version = '*',
) {
  ruby_gem { "${gem} for ${version}":
    gem          => $gem,
    ruby_version => $ruby_version,
  }
}
