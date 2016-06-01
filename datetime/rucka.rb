#!/usr/bin/env ruby
require 'date'

dt = DateTime.new

#tid = dt.now
tid = DateTime.parse('2001-02-03T04:05:06+07:00')

tid2 = DateTime.parse('2001-02-03T04:05:06+07:00')


puts tid.iso8601

tid.second +=1



puts tid.iso8601

#puts DateTime.now.strftime('%FT%T.%6N')
