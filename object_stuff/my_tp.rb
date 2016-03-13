require "test/unit/assertions"
include Test::Unit::Assertions

invariants = TracePoint.new(:call,:return) do |tp|

  # Be sure that checkRep included as method
  assert tp.self.respond_to?(:checkRep)

  if tp.method_id != :checkRep and not 
    (tp.method_id == :initialize and tp.event == :call)  
   
      tp.self.send(:checkRep)
  end  
end

class MyClass

  def initialize
    puts 'initialize'
    puts self.class.name
    @name='Olle'
  end

  def my_method
    puts 'my_method'
    42
  end

  #private
  def checkRep
    puts 'checkRep'
    assert_not_nil @name, "Help"

    assert_equal 2+2, 4.1
  end
end

invariants.enable do 

  foo = MyClass.new
  foo.my_method
end

doo = MyClass.new

doo.my_method


