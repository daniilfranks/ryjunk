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

puts 3.days.ago.class

puts 3.months.ago

puts 3.years.ago


puts 3.days.from_now

puts 3.months.from_now

puts 3.years.from_now


#print @user.try(:first_name)


#n = Date.new(2010, 12, 23).change(year: 2011, month: 11)

n = DateTime.parse("2016-07-29T00:00:00+02:00")
nn = DateTime.parse("2016-07-29T00:00:00+02:00").advance(:hours => -1)
nn = DateTime.parse("2016-07-29T00:00:00+02:00").advance(:minutes => -1)

#p = Time.new(2010, 12, 23)

#pp = Time.new(2010, 12, 23).change(minutes: 11)



puts 'hej'
puts n
puts nn

#puts p
#puts pp