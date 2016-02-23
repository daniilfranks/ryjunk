
# http://www.brianstorti.com/understanding-ruby-idiom-map-with-symbol/

class Foo
  def method_name
    puts "method called for #{object_id}"
  end
end

[Foo.new, Foo.new].map do |element| 
  element.method_name
end