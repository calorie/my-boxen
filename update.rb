require 'open-uri'
require 'json'

READ_START_SYMBOL = '# ---auto update---'
READ_END_SYMBOL   = '# ---/auto update---'

def notify(name, from, to)
  puts "update #{name} from #{from} to #{to}"
end

def fetch(pkg)
  uri = "https://api.github.com/repos/boxen/puppet-#{pkg}/tags"
  result = open(uri).read
  hash = JSON.parse(result)
  hash.first['name']
end

def update(line)
  if line.chomp.empty? || line.chars.first == '#' || !(line =~ /github/)
    return line
  end
  line.match(/^github \"(\w+)\",\s*\"(\d+\.\d+\.\d+)\"/)
  name, version = $1, $2
  new_version = fetch(name)
  return line unless new_version
  notify(name, version, new_version) if version != new_version
  line.gsub(version, new_version)
end

def read(file)
  file = './Puppetfile' if ARGV.empty?
  flg = false
  lines = File.readlines(file)
  lines.map do |l|
    flg = flg || l.chomp =~ /#{READ_START_SYMBOL}/
    flg = flg && !(l.chomp =~ /#{READ_END_SYMBOL}/)
    flg ? update(l) : l
  end
end

def write(lines)
  File.open('./Puppetfile', 'w') do |f|
    lines.each do |l|
      f.write(l)
    end
  end
end

write read(ARGV[0])
