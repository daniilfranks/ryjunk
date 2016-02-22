
# http://www.eriktrautman.com/posts/ruby-explained-map-select-and-other-enumerable-methods
# http://ruby-doc.org/core-2.0.0/Enumerable.html#method-i-none-3F


puts 'each'
[1,2,3].each do | num | print "#{num}!" end
# select

puts 'select'
my_array = [1,2,3,4,5,6,7,8,100]
my_select =  my_array.select do | item | item%2 == 0 end

aa  = {a: 1, b:2, c:3 };ab = {a: 1, b:4, c:8 }; ac = {a: 2, b:4, c:24 }

ll = [aa, ab, ac ]

fem = {b:4}

spec = ll.select do | item | item[:b] == fem[:b] end

left = ll.each do | x | x.delete_if do | p | p.key?(:c) end end 

puts spec



puts my_select


# collect == map!
puts 'collect/map'
my_collect = my_array.collect { |num|  num**2 }

puts my_collect


# inject == reduce
puts 'reduce/inject'

r = [1,2,3,4].reduce do | total, item | total + item end

puts r

class Try
  attr_reader :number
  def initialize
  	@number = rand(1..10)
  end
end

test = [Try.new, Try.new, Try.new]

the_max = test.max_by do | item |  item.number end

puts the_max.number

nn = [{:a => 1, :b => 2, :c => 3}, {:a => 4, :b => 5, :c => 6}].flat_map do | n | 
       [n[:a],n[:b]]
     end

puts 'nn!!!!'
puts nn


#zip !!!


# none?

# any? |

# all? { |e|  }

# find