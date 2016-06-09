require 'mongoid'

# https://mongoid.github.io/en/mongoid/docs/documents.html

Mongoid.load!("mongoid.yml", :development)

class Artist
  include Mongoid::Document
  field :name, type: String
  embeds_many :instruments
end

class Instrument
  include Mongoid::Document
  field :name, type: String
  embedded_in :artist
end

syd = Artist.where(name: "Syd Vicious").between(age: 18..25).first
syd.instruments.create(name: "Bass")
syd.with(database: "bands", session: "backup").save!
