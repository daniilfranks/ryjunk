require 'event_emitter'

# http://shokai.github.io/event_emitter/

class User
  include EventEmitter
  attr_accessor :name
end

user = User.new
user.name = "shokai"
user.on :go do |data|
  puts "#{name} go to #{data[:place]}"
end


user.emit :go, {:place => "mountain"}




user.once :eat do |what, where|
  puts "#{name} ->  eat #{what} at #{where}"
end


user.emit :eat, "BEEF", "zanmai" # =>  "shokai -> eat BEEF at zanmai"
user.emit :eat, "Ramen", "marutomo"  # => do not call.
