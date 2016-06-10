require 'mongoid'

Mongoid.load!("mongoid.yml", :development)


class Person
  include Mongoid::Document
  field :first_name
  field :middle_name
  field :last_name
end

class Match
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  field :datetime
  field :result
  field :matchid
  field :env
end


class FileResulter

  def initialize(filename = 'result.log')
    @file = File.open(filename, 'w')
  end

  def create(matchid: nil, result: nil, env: nil)
    @file.write("matchid:#{matchid},result:#{result},env:#{env}\n")
  end

end


class Launcher


  def initialize(resulter: FileResulter.new)
    @resulter = resulter

    @save = [{matchid:"234", result:"fail", env:"teerve"},
             {matchid:"23", result:"exception", env:"teeraa"}]
  end

  def save

    @save.each do | m |
      @resulter.create(matchid: m[:matchid], result: m[:result], env: m[:env])  
    end

  end

  def old_save

    @save.each do | m |
      @resulter.matchid = m[:matchid]
      @resulter.result  = m[:esult]
      @resulter.env     = m[:env]  
    end

  end

end



if __FILE__ == $PROGRAM_NAME

=begin
p = Person.create(
  first_name: "Heinrich",
  last_name: "Heine"
)

p.save
=end

launcher = Launcher.new(resulter: Match)

launcher.save



p =  Person.where(last_name: "Heine") 

puts p.first.last_name


m = Match.create(matchid: "123", result: "success", env: "test17")


m.save


d = Match.create(matchid: "123", result: "success", env: "test33")


d.save


end
