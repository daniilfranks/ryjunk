require 'set'

A = Set.new [1,2,3,4,5,6,7,8,9,10]

B = Set.new [1,2,9,10,13]



puts 'inner join'
puts((A&B).to_a)

puts 'left join'
puts(((A-B) + (A&B)).to_a)

puts 'left join intersect B'
puts((A-B).to_a)

puts 'right join'
puts((B-A + (A&B)).to_a)

puts 'right join intersect A'
puts((B-A).to_a)

puts 'full join'
puts((A|B).to_a)

puts 'full join exclude intersection A B'
puts(((A|B) - (A&B)).to_a)
