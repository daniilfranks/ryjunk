
require 'ostruct'
require 'net/http'
require 'json'

class APICall < OpenStruct

  def self.execute
    response = Net::HTTP.get(URI('https://jsonplaceholder.typicode.com/posts/1'))
    new(JSON.parse(response))
  end
end


class APICall1 < OpenStruct
  include Enumerable

  def self.execute
    response = Net::HTTP.get(URI('https://jsonplaceholder.typicode.com/posts'))
    new(JSON.parse(response))
  end

  def each
    puts 'we went here!'
  end
end




if __FILE__ == $PROGRAM_NAME

  results = APICall.execute

  puts results.userId
puts results.body

 results = APICall1.execute
  
 puts results

  

end