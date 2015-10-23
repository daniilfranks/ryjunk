
require 'date'
require 'delegate'

class User
  def born_on
    Date.new(1989, 9, 10)
  end

  def kalle
    puts 'kalle'
  end
end

class UserDecorator < SimpleDelegator
  def birth_year
    self.__getobj__.born_on.year
  end
  def born_on
  	puts 'before'
  	to_return = self.__getobj__.born_on
  	puts 'after'
  	return to_return
  end

  def kalle
  	puts 'before'
  	to_return = self.__getobj__.kalle
  	puts 'after'
  	return to_return	
  end

end


puts decorated_user = UserDecorator.new(User.new)
puts decorated_user.birth_year
puts decorated_user.__getobj__ 

puts decorated_user.kalle


class Stats
  def initialize
    @source = SimpleDelegator.new([])
    #@source = Array.new
  end

  def stats(records)
    @source.__setobj__(records)

    "Elements:  #{@source.size}\n" +
    " Non-Nil:  #{@source.compact.size}\n" +
    "  Unique:  #{@source.uniq.size}\n"
  end
end

s = Stats.new
puts s.stats(%w{James Edward Gray II})
puts
puts s.stats([1, 2, 3, nil, 4, 5, 1, 2])