

class MultiArray
  include Enumerable

  def initialize(*arrays)
  	@arrays = arrays
  end

  def each
  	@arrays.each do | a | 
  	  a.each do | x | 
  	    yield x
  	  end 
  	end
  end 

end

if __FILE__ == $PROGRAM_NAME

 ma = MultiArray.new([1,2],[3], [4])

  n = ma.collect
  puts n

  n = ma.detect { | x |  x < 3 }
  
  puts n

 n = ma.each_with_index do | x,i | puts "Element #{i} is #{x}"  end
  
 #puts n
end