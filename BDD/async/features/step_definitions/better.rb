require "observer"
require "test/unit/assertions"
include Test::Unit::Assertions


class Nisse
  include Observable

  def initialize object, q
    @obj = object
    @queue = q
  end

  def run

    while true
      sleep 1
      puts @queue.empty?
      #puts @queue.pop
      if  not(@queue.empty?)
        puts 'poping queue'
        changed
        notify_observers(@obj)
        @queue.pop
        puts 'notified'
        break
      end
      
      
    end
  end
end


Given(/^we can setup an arbitrary user$/) do

  @queue = Queue.new


  class Orvar ;attr_accessor:pilutta ;def initialize ; @pilutta = false ;end end
  @object = Orvar.new

 
  @nisse = Nisse.new @object, @queue
  init_observer(@nisse)
 
end

When(/^I make an update$/) do
  
  # Get ready for a async callback!
  @thread = Thread.new { @nisse.run }

  sleep 3
  puts 'pushing to queue' 
  @queue.push(1)

end

Then(/^I should see the difference$/) do

   
  Timeout::timeout (10) {
    until @object.pilutta do
      sleep 0.05
    end
  }
  
  @thread.join

  puts "-----The end!-----------"	
end
