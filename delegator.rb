require 'delegate'
require 'date'


class User
  def born_on
    Date.new(1989, 9, 10)
  end

  def checkRep x
    puts x
  end
 
end

class UserDecorator < SimpleDelegator
 
  def born_on
    checkRep 'before'
    born_on
    checkRep 'after'
  end

  def birth_year
    born_on.year
  end
end

decorated_user = UserDecorator.new(User.new)
puts decorated_user.birth_year
puts decorated_user.__getobj__