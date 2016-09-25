define people::calorie::ruby::gems(
  $gem          = $title,
  $ruby_version = '*',
) {
  ruby_gem { "${gem} for ${ruby_version}":
    gem          => $gem,
    ruby_version => $ruby_version,
  }
}
