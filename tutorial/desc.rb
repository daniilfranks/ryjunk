class Parent
  attr_reader :nisse

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end

class Child < Parent

    def self.nu
	   return "hej"
    end
end

class Nisse < Parent
	def self.nu
	   return "hoj hoj"
	end
end


puts Parent.descendants


Parent.descendants.each do | x |  puts x.nu end

