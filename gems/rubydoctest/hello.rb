def hello name='World'
  "Hello " + name + "!"
end
=begin
doctest: hello returns "Hello World!"
>> hello
=> "Hello World!"
doctest: hello "reader" returns "Hello reader!"
>> hello "student"
=> "Hello student!"
=end

