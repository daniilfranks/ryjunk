require 'json'


fh = File.open('my.json', 'r')
json = fh.read()

puts json

object = JSON.parse(json)
#object["apikeys"] << 13
object << 13

fh = File.open('my.json', 'w')
fh.write(JSON.pretty_generate(object))
fh.close()
