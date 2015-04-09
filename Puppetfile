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
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.2"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.7.5"
github "go",          "2.1.0"
github "homebrew",    "1.11.2"
github "hub",         "1.4.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.4"
github "nodejs",      "4.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "7.3.0"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

github "java",                  "1.1.0"
# ---auto update---
github "sysctl",                "1.0.1"
github "dropbox",               "1.4.1"
github "mysql",                 "1.2.2"
github "postgresql",            "3.0.3"
github "iterm2",                "1.2.4"
github "chrome",                "1.2.0"
github "firefox",               "1.2.3"
github "skype",                 "1.1.0"
github "redis",                 "3.1.0"
github "icu4c",                 "1.0.1"
github "imagemagick",           "1.3.0"
github "libtool",               "1.0.0"
github "osx",                   "2.8.0"
github "alfred",                "1.4.0"
github "virtualbox",            "1.0.13"
github "vagrant",               "3.3.0"
github "python",                "2.0.0"
github "gdb",                   "1.0.0"
github "mongodb",               "2.6.1"
github "php",                   "1.2.6"
github "macvim",                "1.0.0"
github "evernote",              "2.0.7"
github "automake",              "1.0.0"
github "cmake",                 "1.0.1"
github "wget",                  "1.0.1"
github "zsh",                   "1.0.0"
github "android",               "1.4.0"
github "vim",                   "1.0.5"
github "tmux",                  "1.0.2"
github "ctags",                 "1.0.0"
github "appcleaner",            "1.0.0"
github "flux",                  "1.0.1"
github "karabiner",             "1.0.6"
github "heroku",                "2.1.1"
github "caffeine",              "1.0.0"
github "memcached",             "2.0.0"
github "better_touch_tools",    "3.0.0"
github "slack",                 "1.0.6"
github "vlc",                   "1.1.0"
github "onepassword",           "1.1.5"
# ---/auto update---
github "teamviewer",            "1.0.2", :repo => "singuerinc/puppet-teamviewer"
github "perl",                  "1.1.2", :repo => "typhonius/puppet-perl"
github "gyazo",                 "1.0.0", :repo => "calorie/puppet-gyazo"
github "google_japanese_input", "1.0.0", :repo => "calorie/puppet-google_japanese_input"
github "macid",                 "1.1.1", :repo => "calorie/puppet-macid"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
