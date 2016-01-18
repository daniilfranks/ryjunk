
#    _                              _ 
#   / \   _ __ ___  _   _ _ __   __| |
#  / _ \ | '__/ _ \| | | | '_ \ / _` |
# / ___ \| | | (_) | |_| | | | | (_| |
#/_/   \_\_|  \___/ \__,_|_| |_|\__,_|

Around('@fast') do |scenario, block|
  Timeout.timeout(0.0) do
    block.call
  end
end


# ____        __
# | __ )  ___ / _| ___  _ __ ___
# |  _ \ / _ \ |_ / _ \| '__/ _ \
# | |_) |  __/  _| (_) | | |  __/
# |____/ \___|_|  \___/|_|  \___|

Before('@test') do
  puts 'BEFORE'
end

#    / \   / _| |_ ___ _ __
#   / _ \ | |_| __/ _ \ '__|
#  / ___ \|  _| ||  __/ |
# /_/   \_\_|  \__\___|_|

After('@test') do
  puts 'AFTER'
end

AfterStep('@pause') do
  puts "Press Return to continue"
  STDIN.getc
end

#  ____ _
# / ___(_)_   _____ _ __
# | |  _| \ \ / / _ \ '_ \
# | |_| | |\ V /  __/ | | |
#  \____|_| \_/ \___|_| |_|
#


# You can implement step definitions for undefined steps with these snippets:

Given(/^that I have a table$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  table.hashes.each do | data | data end
end


Given(/^we have behave installed$/) do
  #pending # Write code here that turns the phrase above into concrete actions
  puts 'We have cucumber installed!'
  #expect (@kalle).to  eq(0)
  #puts @HelpMe::NUDA
  #puts "name of :   #{self.class.name}  #{self.methods} "

  puts"variables #{self.instance_variables}"
#  puts"methods #{self.instance_methods}"
  puts "type #{self.class}"

  if not ENV.nil?
    for i in ENV
      puts i
    end

  end 

  puts "HEJ: #{ENV['FOO']}"

  #if not FOO.nil?

#    puts FOO
#  end

  #assert false
  @kalle = 1
end

#__        ___
#\ \      / / |__   ___ _ __
# \ \ /\ / /| '_ \ / _ \ '_ \
#  \ V  V / | | | |  __/ | | |
#   \_/\_/  |_| |_|\___|_| |_|

When(/^we implement a test$/) do
  #pending # Write code here that turns the phrase above into concrete actions
  @kalle+=1

end

Then(/^behave will test it for us!$/) do
  #pending # Write code here that turns the phrase above into concrete actions

  @nisse.shot
end

Given(/^there are (\d+) cucumbers$/) do |arg1|
  puts "Got1: #{arg1}"
end

When(/^I eat (\d+) cucumbers$/) do |arg1|
  puts "Got2: #{arg1}"
end


#_____  _
#|_   _| |__   ___ _ __
#  | | | '_ \ / _ \ '_ \
#  | | | | | |  __/ | | |
#  |_| |_| |_|\___|_| |_|


Then(/^I should have (\d+) cucumbers$/) do |arg1|
  puts "Got3: #{arg1}"
end
