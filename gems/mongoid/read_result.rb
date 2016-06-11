require 'mongoid'

#Mongoid.load!("mongoid.yml", :development)

class Match
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  field :datetime
  field :result
  field :matchid
  field :env
end





if __FILE__ == $PROGRAM_NAME

 ENV["MONGOID_ENV"]="mongoid.yml"
 puts "env: #{ENV["USER"]}"

  puts "env: #{ENV["MONGOID_ENV"]}"

  p Match.count


  d = Match.where(matchid: "123") #, result: "success", env: "test33")


  Match.where(matchid: "23").each do | match |
    p match.result, match.env
  end
   

  #p d.result


end
