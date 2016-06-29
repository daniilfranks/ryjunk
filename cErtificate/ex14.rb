user_name = ARGV.first # gets the first argument

prompt = '> '

puts "Hi #{user_name}."
puts "Do you like me?"
print prompt
likes = $stdin.gets.chomp

puts """
Alright, so you said #{likes} about me.
You live in
""" 
