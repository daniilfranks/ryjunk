require 'pp'


tracer = TracePoint.new(:call,:return) do |tp|
  if tp.method_id != :checkRep
    tp.self.send(:checkRep)
  end
end

class MyClass
  def my_method
    puts 'my_method'
    42
  end

  def checkRep
    puts 'checkRep'
    51
  end
end

tracer.enable

foo = MyClass.new


foo.my_method


