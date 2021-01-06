#!/usr/bin/env ruby

require "fileutils"
require "./lib/swot.rb"

ARGF.each do |line|
  swot = Swot.new(line.strip)
  file_path = swot.send(:file_path)

  if File.exist?(file_path)
    next
  else
    FileUtils.mkdir_p File.dirname(file_path)
    File.open(file_path, "w") { |f| f.puts(swot.domain.domain.split('.').first) }
  end
end
