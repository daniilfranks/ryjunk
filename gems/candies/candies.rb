require 'mongo'
require 'candy'
include Candy::Crunch


class Person
  include Candy::Piece
end


Candy.host='192.168.1.7'
Candy.port='27017'
#Candy.connection
#Candy.connection_options (A hash of options to the Connection object)
Candy.db='my_db'# (Can provide a string or a database object)

puts Candy.connection

me = Person.new

puts me.inspect


#me.last_name = 'Eley'   # New record created and saved to Mongo
puts me.id                   # => ObjectID(4bb606f9609c8417cf00004b) or thereabouts
me[:height] = 67        # Or me.height = 67 -- either way, updates with a Mongo $set

