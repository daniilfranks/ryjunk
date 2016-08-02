
require 'set'

A = Set.new (2..30)

B = Set.new [2,3,4,6]

#puts A.to_a

#puts B.to_a

puts (((A-B)).to_a).first
