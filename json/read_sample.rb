require 'json'
require 'pp'
require 'ostruct'

# Read json file that turns it to ruby objects

fh = File.read("./sample.json") 

#data = JSON.load(fh, proc=ostruct)
data = JSON.parse(fh, object_class: OpenStruct)
#data = JSON.load(fh)
fathers = data.fathers

#pp fathers[0].name


#data = File.readlines("./load_employees.dump.txt")
data = File.readlines("./names.txt")

names =Hash.new

data.each_with_index do | x, i |

  break if i == 10

  # (10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21'),
  fields = x.split(',')

  first = fields[2].gsub("'","")
  last = fields[3].gsub("'","")
  name = first + ' ' + last
  idx = 9000000 + i
  names.merge!( idx => { :Id => idx, 
  	                     :members =>  {
  	                     	:name => name, 
  	                     	:first_name => first,
  	                     	:last_name => last
  	                     }
  	                    }
  	           )

 


end 

  #data = []
  player = {:Team => 'nisse', :Player => names}
  #team   = {:Team => 'nisse'}
  reqs = {:requirements => player}

  jayson = JSON.generate(reqs) #data.to_json
  

fh = File.open('fake_requirements.json', 'w')

fh.write(JSON.generate(reqs))

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
