
# You can implement step definitions for undefined steps with these snippets:

Given(/^we have behave installed$/) do
  #pending # Write code here that turns the phrase above into concrete actions
  puts 'We have cucumber installed!'
  assert @kalle == 0
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

When(/^we implement a test$/) do
  #pending # Write code here that turns the phrase above into concrete actions
  @kalle+=1
  assert true
end

Then(/^behave will test it for us!$/) do
  #pending # Write code here that turns the phrase above into concrete actions
  assert @kalle == 2
  @nisse.shot
end
