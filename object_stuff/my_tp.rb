require 'pp'


invariants = TracePoint.new(:call,:return) do |tp|


  if tp.method_id != :checkRep and not 
    (tp.method_id == :initialize and tp.event == :call)  
   
      tp.self.send(:checkRep)
  end  
end

class MyClass

  def initialize
    puts 'initialize'
    puts self.class.name
  end

  def my_method
    puts 'my_method'
    42
  end

  private
  def checkRep
    puts 'checkRep'
    51
  end
end

invariants.enable do 

  foo = MyClass.new
  foo.my_method
end

doo = MyClass.new

doo.my_method


