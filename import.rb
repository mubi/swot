#!/usr/bin/env ruby

require "fileutils"

ARGF.each_with_index do |line, idx|
  parts = line.strip.split(".").reverse
  name = parts.pop
  dirs = parts.join("/")
  path = "#{File.expand_path(__FILE__+'/..')}/lib/domains/#{dirs}"
  if File.exist?("#{path}/#{name}.txt")
    next
  else
    FileUtils.mkdir_p path
    File.open("#{path}/#{name}.txt", "w") { |f| f.puts(name) }
  end
end
