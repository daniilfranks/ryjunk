#!/usr/bin/env ruby
require 'date'

dt = DateTime.new

#tid = dt.now
tid = DateTime.parse('2001-02-03T04:05:06+07:00')

puts DateTime.now

puts DateTime.parse('2001-02-03T04:05:06+07:00')

puts tid.month
puts tid.year