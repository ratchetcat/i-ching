#!/usr/env/ruby -w

require File.expand_path(File.dirname(__FILE__) + "../../lib/iching")

cast = IChing::Cast.new
cast.hexagrams.each do | hexagram |
  puts
  puts hexagram.to_s
  puts hexagram.description[:name]
  hexagram.moving_lines.each { | line | puts "Lines #{ line }" }
end