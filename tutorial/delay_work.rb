

queue = Queue.new


queue << Proc.new do puts 'hej' end
queue << Proc.new do puts 'da' end


puts queue.pop.call()

puts queue.class


my_array = Array.new


my_array << Proc.new do puts 'mer' end


my_array.each do | x | x.call() end


