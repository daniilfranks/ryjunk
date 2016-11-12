
require 'reductio'

inc = Reductio::Add.(1)

add3 = Reductio::Compose.(inc, inc, inc)

puts add3.(4)  

=begin
request = proc { |resource, args | 
  proc { |resource| 

  # Just send the request to API, dont care of
  # the request
  return 42

 } }.curry


response = proc { |json_reply, expected_code | 
  proc { |json_reply | 

  # Just send the request to API, dont care of
  # the request
  return 42

 } }.curry


=end


#req_response = Reductio::Compose.(request, response)

# assert req_response  ???

add = proc { |x| proc { |y| x +y } }.curry
inc = add.(1)
dec = add.(-1)

compose = proc { |x, y| proc { |*args| x.(y.(*args)) }}
v_compose = proc { |*func| func.reduce(&compose) }

add3 = v_compose.(inc, dec , inc)
puts add3.(4)

