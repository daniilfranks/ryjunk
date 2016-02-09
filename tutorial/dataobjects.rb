require 'json'
require 'ostruct'

# http://andreapavoni.com/blog/2013/4/create-recursive-openstruct-from-a-ruby-hash/#.Vio38CDtlBd

class A

    attr_reader :data

	def initialize(d)
		@data = d
		#d.a
		puts "Hej"
	end

	def tut
		puts 'tut'
	end

        def method_missing(sym)
           puts "Hej Hej: #{sym}"
           @data.send(sym)
        end
end

class B

end


hash = {:a=>1,:b=>[{:c=>2,:d=>[{:e=>3,:f=>4},{:e=>5,:f=>6}]},{:c=>4,:d=>[{:e=>7,:f=>8},{:e=>9,:f=>10}]},{:c=>6,:d=>[{:e=>11,:f=>12},{:e=>13,:f=>14}]}]}


json = hash.to_json
object = JSON.parse(json, object_class: OpenStruct)

#puts object.a

puts "Hej hopp i galopp!"
puts [object.a, object.x].all?


#puts object.b[0].d[1].f


aa = A.new(object)



print "From A:  ", aa.a, ":the end"
puts


#print B.new.object

#my = [ A ] 

#test = lambda do | d |   d  end


#nnn = my.select { |e| test(e)  }

#a = A.new(1)

#my <<  a 

#puts my

#my[1].tut

array = [ 1, 2 ,3]

nisse = {:apikeys => array}

json = nisse.to_json
#object = JSON.parse(json, object_class: OpenStruct)
object = JSON.parse(json)

#object.apikeys << 13
object["apikeys"] << 13

puts object

fh = File.open('my.json', 'w+')

fh.write(JSON.dump(object))

fh.close()

