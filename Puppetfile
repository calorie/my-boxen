# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.3.4"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.0"
github "foreman",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "go",         "1.0.0"
github "homebrew",   "1.5.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.3.0"
github "openssl",    "1.0.0"
github "phantomjs",  "2.0.2"
github "pkgconfig",  "1.0.0"
github "repository", "2.2.0"
github "ruby",       "7.0.1"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

github "java",             "1.1.0"
# ---auto update---
github "dropbox",          "1.2.0"
github "mysql",            "1.2.0"
github "iterm2",           "1.0.5"
github "chrome",           "1.1.2"
github "skype",            "1.0.7"
github "redis",            "2.1.0"
github "icu4c",            "1.0.1"
github "imagemagick",      "1.2.1"
github "libtool",          "1.0.0"
github "osx",              "2.2.0"
github "alfred",           "1.1.7"
github "virtualbox",       "1.0.9"
github "python",           "1.3.0"
github "gdb",              "1.0.0"
github "mongodb",          "1.2.0"
github "php",              "1.1.4"
github "macvim",           "1.0.0"
github "evernote",         "2.0.4"
github "automake",         "1.0.0"
github "cmake",            "1.0.1"
github "wget",             "1.0.0"
github "zsh",              "1.0.0"
github "android",          "1.0.0"
github "vim",              "1.0.5"
github "tmux",             "1.0.2"
github "ctags",            "1.0.0"
github "appcleaner",       "1.0.0"
github "hipchat",          "1.1.0"
github "jumpcut",          "1.0.0"
github "flux",             "1.0.0"
github "keyremap4macbook", "1.2.1"
github "teamviewer",       "1.0.2", :repo => "singuerinc/puppet-teamviewer"
# ---/auto update---
mod "module-data", "0.0.1", :github_tarball => "ripienaar/puppet-module-data"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
