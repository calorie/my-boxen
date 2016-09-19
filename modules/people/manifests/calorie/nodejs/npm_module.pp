define people::calorie::nodejs::npm_module(
  $module       = $title,
  $node_version = '*',
) {
  require nodejs

  npm_module { "install $module":
    module       => $module,
    node_version => $node_version,
  }
}
