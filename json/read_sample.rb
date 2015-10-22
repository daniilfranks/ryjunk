require 'json'
require 'pp'
require 'ostruct'

# Read json file that turns it to ruby objects

fh = File.read("./sample.json") 

data = JSON.load(fh, proc=ostruct)
#data = JSON.load(fh)
puts data.fathers

# Traverse and check that we have uniqe data

# Build dict for every type of object.  Verify validity

# Print some statitics, use forwardable or delegator or something similar?

# More to come? ML?  control feedback?

# This database should be read before every session

# Backup database if not hit for id:s?

# Create leagues with help of FIFA and EUFA (nokogiri?)

# Use new numbers (on high series) for random names? (inlcuded files?)
