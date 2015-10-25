require 'Enumerable'
str = "xyz"

enum = Enumerable::Enumerator.new(str, :each_byte)
a = enum.map {|b| '%02x' % b } #=> ["78", "79", "7a"]

puts a