#!/usr/env/ruby -w

require File.expand_path(File.dirname(__FILE__) + "../../lib/iching")

puts
puts "Example Cast:"
cast = IChing::Cast.new
cast.hexagrams.each do | hexagram |
  puts hexagram.to_s
  puts hexagram.description[:name]
  hexagram.moving_lines.each { | line | puts "Lines #{ line }" }
  puts
end

puts "Example Trigram 1:"
t = IChing::Trigram.new( [ 0, 0, 1 ])
puts t.to_s
puts t.description[:name]
puts

puts "Example Trigram 2:"
t = IChing::Trigram.new( [ 0, 1, 1 ])
puts t.to_s
puts t.description[:name]