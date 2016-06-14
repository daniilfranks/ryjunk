#require 'mongoid'
require_relative 'resulter'
#Mongoid.load!("mongoid.yml", :development)
=begin
class Match
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  field :datetime
  field :result
  field :matchid
  field :env
end

=end





if __FILE__ == $PROGRAM_NAME

 #ENV["MONGOID_ENV"]="mongoid.yml"
 #puts "env: #{ENV["USER"]}"

#  puts "env: #{ENV["MONGOID_ENV"]}"

#  p Match.count


#  d = Match.where(matchid: "123") #, result: "success", env: "test33")


  Match.where(matchid: "23").each do | match |
    puts "#{match.result}, #{match.env}, #{match.created_at} "
  end
   
  # TODO: list a specific match and include date and how it was ended

  Match.between(created_at: (3.days.ago..Time.now)).each do | match |
    puts 'tut'
    puts "#{match.result}"
  end


  #p d.result


end
