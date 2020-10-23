#!/usr/bin/env ruby

require "fileutils"
require "./lib/swot.rb"

Swot.all_domains.compact.each do |domain|
  swot = Swot.new(domain)
  swot_file_path = swot.send(:file_path)
  custom_file_path = Swot.domains_path + '/' + domain.split('.').reverse.join('/') + '.txt'

  if File.exists?(custom_file_path) && swot_file_path != custom_file_path
    File.delete(custom_file_path)
  end

  if File.exist?(swot_file_path)
    next
  else
    FileUtils.mkdir_p Swot.domains_path
    File.open(swot_file_path, "w") { |f| f.puts(swot.domain.domain.split('.').first) }
  end
end
