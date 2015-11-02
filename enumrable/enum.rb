#require 'enumerator'
str = "xyz"

# deprcerated
#enum = Enumerable::Enumerator.new(str, :each_byte)
#enum = Enumerator.new(str, :each_byte)

# new ones ....
enum = str.enum_for(:each_byte)
enum = str.to_enum(:each_byte)
a = enum.map {|b| '%02x' % b } #=> ["78", "79", "7a"]

puts a