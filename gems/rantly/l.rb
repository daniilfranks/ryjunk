require "singleton"

class Nil
 
  include Singleton

  def empty?;return true ; end

  def to_s
  	"Nil"
  end 
end

class Cons
  def initialize(head, tail = Nil.instance)
    @head = head
    @tail = tail
  end	

  attr_reader :head, :tail

  def empty?;return false ; end

  def to_s

  	"( #{head} . #{tail.to_s} )"
  end
end

def do_something_amazing(list, acc = Nil.instance)
	super_value = list.head * 1337 unless list.empty?
	#puts list.tail
	if list.empty?
		#puts list.tail
		acc
	else
		do_something_amazing(list.tail,  Cons.new(super_value, acc))
	end
end


module List 
	
	def self.reverse(list, acc = Nil.instance)
		if list.empty?
			acc
		else 
			puts list.tail
			reverse(list.tail, Cons.new(list.head, acc))
		end
	end

	def self.from_values(*values)
		values.reverse.inject(Nil.instance) { |ls ,v | Cons.new(v, ls)}
	end

end
  

if __FILE__ == $PROGRAM_NAME

  l = Cons.new(1, Cons.new(2, Cons.new(3, Nil.instance)))
  #puts l.to_s

  puts do_something_amazing(l).to_s
  
  puts List.reverse( do_something_amazing(l)).to_s

end

