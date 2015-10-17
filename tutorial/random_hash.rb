
nn = Random.new

dict = Hash.new(0)

hoj_hoj = {:Event => 'Goal', :Occured => true}

dict[nn] = hoj_hoj


puts dict[nn][:Occured]


if dict[nn][:Occured]
  puts 'Hurra'
end
