#require  'activesupport'
require  'active_support/all'
#require 'active_support/core_ext/object/try.rb'

#http://guides.rubyonrails.org/active_support_core_extensions.html

class User

  attr_reader :first_name

  def initialize
    @first_name = 'Olle'
#    @first_name = nil
  end

end 

@user = User.new

puts 3.days.ago

puts 3.months.ago

puts 3.years.ago


puts 3.days.from_now

puts 3.months.from_now

puts 3.years.from_now


print @user.try(:first_name)

