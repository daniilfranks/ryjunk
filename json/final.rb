
require 'json'

class A

  def initialize(file='vv.json')
    ObjectSpace.define_finalizer(self, self.class.method(:finalize))
    #ObjectSpace.define_finalizer( self, self.class.finalize )
    @file = file
    @fh = File.open(@file, 'w')
    @aa = Array.new
  end

  def write(id)
    @aa.push(id)
    puts 'trying to write'
    puts @aa
  end 

  def self.finalize(object_id)
    puts @aa.empty?
    object = JSON.pretty_generate(@aa)
    puts object
    @fh.write(object) 
    @fh.close()
    puts 'the end'
  end

  def remove
  end

  def read
    
  end

end

a = A.new

#A.finalize(1)


a.write(1)
a.write(2)


a = nil




