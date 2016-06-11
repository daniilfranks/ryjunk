require 'mongoid'
require 'csv'
require 'date'

Mongoid.load!("mongoid.yml", :development)


class Match
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  field :datetime
  field :result
  field :matchid
  field :env
end


# TODO: -save with datetime-stamp
#       - save with as csv  
#       - save with header matchid, result, env    

class FileResulter

  def initialize(filename = "result_#{DateTime.now.strftime('%FT%R')}.csv")
    @file = CSV.open(filename, 'w')
    @file << ["matchid","result","env"]
  end

  def create(matchid: nil, result: nil, env: nil)
    #@file.write("matchid:#{matchid},result:#{result},env:#{env}\n")
    @file << ["#{matchid}","#{result}","#{env}"]
  end

end

