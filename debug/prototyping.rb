
module DEBUG
   ON = false

def debug(str)
  puts str if ON 
end

end

include DEBUG

class NyClass

  @@debug = false

  def self.debug= value
    @@debug = value
  end
end

class MyClass < FalseClass

  def self.call
    self
  end
end



class LittleClass

  def this_is_it
   
    puts 'Little we got a debug on ....' if DEBUG::ON
    debug('more and more')
  end
end

class BigClass

  def this_is_it
    puts 'Big we got a debug on ....' if DEBUG::ON


  end
end


if __FILE__ == $PROGRAM_NAME

  
 
  little_class = LittleClass.new()
  big_class = BigClass.new()
  #MyClass.debug= true

  little_class.this_is_it
  big_class.this_is_it
end
