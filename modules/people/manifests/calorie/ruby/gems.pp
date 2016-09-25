define people::calorie::ruby::gems(
  $gem          = $title,
  $ruby_version = '*',
) {
  ruby_gem { "${gem} for ${version}":
    gem          => $gem,
    ruby_version => $ruby_version,
  }
}
