#require 'sham'
#require 'forgery'
require "observer"
require 'machinist'
require 'faker'
require "test/unit/assertions"
include Test::Unit::Assertions


class Nisse
  include Observable

  def initialize object
    @obj = object
  end

  def run

  	#puts 'trying to notify'
  	sleep 6
  	changed
  	notify_observers(@obj)
  end
end


# http://itsignals.cascadia.com.au/?p=30
# http://stackoverflow.com/questions/3441936/machinist-for-non-activerecord-models
# http://geekswithblogs.net/alexmoore/archive/2010/01/18/faker-gem---a-quick-and-dirty-introduction.aspx
require 'securerandom'

class ExternalUser
	extend Machinist::Machinable
	attr_accessor :organisation, :description, :contact, :email, :phone, :website,
	              :svscontact, :enabled, :apikey, :apikeyid

# http://stackoverflow.com/questions/5030553/ruby-convert-object-to-hash
    def to_hash
      hash = {}
      instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
      hash
    end	
end

class MyObject
	extend Machinist::Machinable
	attr_accessor :name, :email
end

# For all Objects
class Object
 extend Machinist::Machinable

 def self.blueprint_class
   Machinist::Blueprint
 end
end  

Given(/^we can setup an arbitrary user$/) do
  # Shams
  # We use forgery to make up some test data
  
  @my_array = {}
  @my_array[:pilluta] = false

  class Orvar ;attr_accessor:pilutta ;def initialize ; @pilutta = false ;end end

  @object = Orvar.new

  @nisse = Nisse.new @object
  init_observer(@nisse)
 
 
  # Blueprints
  # http://www.rubydoc.info/github/stympy/faker/frames
 ExternalUser.blueprint do
 	organisation {Faker::Company.name}
 	description  {Faker::Lorem.sentence}
 	contact      {Faker::Name.name}
    email        {Faker::Internet.email}
    phone        {Faker::PhoneNumber.cell_phone}
    website      {Faker::Internet.url}
    svscontact   {Faker::Name.name}
    enabled      {true}
    apikey       {SecureRandom.uuid}
    apikeyid     {} 
  end  

  MyObject.blueprint do
    email { Faker::Name.name }
    name { Faker::Internet.email }
  end

  @obj = MyObject.make(3)
  @test = MyObject.make
  #@test.should be_a(MyObject)
  #test = MyObject.make_unsaved(:date => Time.now)

  #pending # Write code here that turns the phrase above into concrete actions
  user = ExternalUser.make

  user.enabled = false

  #puts user.to_hash
end

When(/^I make an update$/) do
  #puts @obj.inspect
  @old_email = @obj.first.email
  @obj.first.email = "nisse.hult@gmail.com" 	
  #pending # Write code here that turns the phrase above into concrete actions
  
  # Get ready for a async callback!
  @pilutta = false
  @thread = Thread.new { @nisse.run }

end

Then(/^I should see the difference$/) do
  assert_not_equal @old_email, @obj.first.email 

  Timeout::timeout (10) {
    until @object.pilutta do
      sleep 0.05
    end
  }
  
  @thread.join


  puts "-----The end!-----------"	
  #pending # Write code here that turns the phrase above into concrete actions
end