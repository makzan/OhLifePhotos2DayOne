#!/usr/bin/env ruby

# This script takes the STDIN of images list and create new entry into DayOne.
# Assumed the format of filename is "img_YYYY-MM-DD-*.*"
#
# Makzan
# https://github.com/makzan/OhLifePhotos2DayOne


arg = ARGF.read.gsub(' ', '').gsub("\n", '')

files = arg.split ','

puts "Importing #{files.size} photos to DayOne."

files.each do |filename|
  d = filename[4..13] + " 00:00"
  puts "Importing #{filename}"
  cmd = "echo \"\" | dayone --date='#{d}' --photo-file=#{filename} new"  
  system cmd  
end