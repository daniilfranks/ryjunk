

Given(/^We have a computer$/) do
  puts "Check what OS we are running!"  
end

When(/^we ask for a active network interface$/) do
  puts "How to check this on a Mac with ruby?"
end

Then(/^the computer can confirm we have one$/) do
  puts "Check that we have something different than nil?"
end


Given(/^we have a network interface$/) do
  step "We have a computer"
  step "we ask for a active network interface"
  step "the computer can confirm we have one"
end

When(/^pinging our local adress$/) do
  # uses ICMP 
  @reply =  system("ping -c 1 127.0.0.1 > /dev/null")
  
  # uses TCP
  require 'net/ping'
  @reply2 = Net::Ping('127.0.0.1', 1)
end

Then(/^we get a valid reply$/) do
  assert @reply
  assert @reply2
end