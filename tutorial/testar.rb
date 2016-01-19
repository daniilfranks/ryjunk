require 'json'
require 'pp'
require 'ostruct'


hash = {

  "12345"=> {
    "members" => {
     "name"=> "23456"
    }
  }
}

json = hash.to_json
object = JSON.parse(json, object_class: OpenStruct)

pp object

#nisse = object.to_h.each do | k |  k.keys end
nisse = object.to_h.keys[0]
nisse = object.to_h.keys.first
#nisse = object.to_h.keys.to_sym

pp object[nisse].members.name

=begin
object.to_h.each_with_index do |d, i|
  puts "#{i} #{d[1]}"
  d[1].to_h.each do |k|
    puts k['name']
  end
end
=end