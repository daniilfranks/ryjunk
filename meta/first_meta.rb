#!/usr/bin/env ruby

class Array
    def foldl(method)
       inject{ |result, i| result ? result.send(method, i) : i }
    end
end



puts [1000.0, 200.0, 50.0].foldl("/")

puts [1,2 ,3 ].foldl("+")

puts ['h', 'i'].foldl("concat")



require 'json'
require 'ostruct'


class Test
   attr_reader :data
   def initialize(data)
      @data = data
   end

   def method_missing(sym, *args, &block)
      @data.send(sym, *args, &block)
      puts "in method missing"
   end

end


hash = {:a=>1,:b=>[{:c=>2,:d=>[{:e=>3,:f=>4},{:e=>5,:f=>6}]},{:c=>4,:d=>[{:e=>7,:f=>8},{:e=>9,:f=>10}]},{:c=>6,:d=>[{:e=>11,:f=>12},{:e=>13,:f=>14}]}]}



json = hash.to_json



object = JSON.parse(json, object_class: OpenStruct)



test = Test.new(object)

puts "hej hopp:", test.data.a

puts "nu ...:"

puts  test.a