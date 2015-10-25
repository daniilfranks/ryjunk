require 'json'
require 'pp'
require 'ostruct'

# Read json file that turns it to ruby objects

fh = File.read("./sample.json") 

#data = JSON.load(fh, proc=ostruct)
data = JSON.parse(fh, object_class: OpenStruct)
#data = JSON.load(fh)
fathers = data.fathers

pp fathers[0].name


#data = File.readlines("./load_employees.dump.txt")
data = File.readlines("./names.txt")

names =Hash.new

data.each_with_index do | x, idx |

  break if idx == 10

  # (10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21'),
  fields = x.split(',')

  names.merge!( idx => { :first_name => fields[2], :last_name => fields[3]})

 


end 

  data = []
  data.push(names)

  jayson = JSON.generate(data) #data.to_json
  
  pp jayson

require 'nokogiri'
require 'open-uri'

# http://www.uefa.com/memberassociations/leaguesandcups/index.html

# Fetch and parse HTML document
#doc = Nokogiri::HTML(open('http://www.uefa.com/memberassociations/leaguesandcups/index.html'))

#pp doc.search(".fr")


# Traverse and check that we have uniqe data

# Build dict for every type of object.  Verify validity

# Print some statitics, use forwardable or delegator or something similar?

# More to come? ML?  control feedback?

# This database should be read before every session

# Backup database if not hit for id:s?

# Create leagues with help of FIFA and EUFA (nokogiri?)

# Use new numbers (on high series) for random names? (inlcuded files?)
