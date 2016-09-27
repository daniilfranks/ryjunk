#!/usr/bin/env ruby
require 'date'

dt = DateTime.new

#tid = dt.now
tid = DateTime.parse('2001-02-03T04:05:06+07:00')

tid2 = DateTime.parse('2001-02-03T04:05:06+07:00')

puts DateTime.now

puts DateTime.parse('2001-02-03T04:05:06+07:00')

puts 'hej'
puts DateTime.parse("2015-03-06T19:11:45.3132274+01:00")
puts DateTime.parse("2015-03-06T19:11:45.3132274+01:00")

#puts tid.month
#puts tid.year

#if tid2 < Time.now
#   puts "Correct"
#end

puts "with microsecs"

puts DateTime.now.strftime('%FT%T.%6N')

collection = [ tid , tid2 ]

collection.min


7.times { puts DateTime.now.strftime('%A') }