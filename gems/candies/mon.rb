require 'mongo'
include Mongo

mongo_client = MongoClient.new("192.168.1.7", 27017)

db = mongo_client.db("my_db")

#puts db.inspect

database = mongo_client.database

puts database.collections

