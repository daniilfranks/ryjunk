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
puts "--"*40
puts ActiveSupport::Inflector.transliterate('Ærøskøbing')
puts ActiveSupport::Inflector.transliterate('öåä')
#7.times { puts DateTime.now.strftime('%A') }



#puts DateTime.now.advance(days: 1).strftime('%A') 




=begin
7.times  {  | x | 
 print " #{x}"
 puts now.strftime('%A') 
 return now if  now.strftime('%A')  == 'Saturday'
 now = now.advance(days: x)
}


nn = (0..7).find  do |i| 
#   now.advance(days:i).strftime('%A')  == 'Saturday'
   now.advance(days:i).strftime('%A')  == 'Sunday'
end

puts nn
=end


now = DateTime.now.advance(days:0)

bn = (0..7).each_with_index.collect { |i| now.advance(days:i) }.find { |x| x.strftime('%A')  == 'Saturday' }.change(hour: 16)

puts "NUDA"
#puts bn.find { |x| x.strftime('%A')  == 'Saturday' }
puts bn


puts "*"*40
puts DateTime.current

puts DateTime.now


puts "-"*40
puts DateTime.now.change({ hour: 7 })    

puts DateTime.now.days_ago(4)


puts DateTime.current.years_ago(5).beginning_of_year