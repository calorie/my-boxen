define people::calorie::nodejs::npm_module(
  $module       = $title,
  $node_version = '*',
) {
  npm_module { "install $module":
    module       => $module,
    node_version => $node_version,
    require      => [Nodejs::Version[$node_version]],
  }
}
