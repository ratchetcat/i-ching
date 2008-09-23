#!/usr/env/ruby -w

require 'iching.rb'

c = IeChing::Caster.new
c.cast
c.hexagrams.each do | h |
  puts h.to_s
  puts h.description[:name]
  if h.moving?
    h.moving_lines.each do | l |
      puts "Lines #{ l }"
    end
  end
  puts
end