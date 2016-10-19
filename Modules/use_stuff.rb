require_relative 'stuff'

puts Stuff::C     # Stuff namespace  
puts Stuff.m(3)   # like a class method  
x = Stuff::T.new  
# uninitialized constant error, if you try the following  
# puts C  

puts Stuff.pelle

puts Stuff.const_get("C".to_sym)
