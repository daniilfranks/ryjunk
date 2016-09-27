Given(/^that$/) do 
  #puts self.methods	
  #puts 'that'	
  #pending # Write code here that turns the phrase above into concrete actions
end

When(/^this happen (.*) (.*)$/) do | *args |
  #puts args

  @nisse = args.collect do | x | x end   if args.first =~ /[[:alpha:]]/  # /(\w)+/

  @nisse.each_with_index do | x, idx | @nisse[x] = args[idx] end if args.first =~ /(\d)+/


  puts "::#{@nisse}::"	
  #pending # Write code here that turns the phrase above into concrete actions
end

Then(/^this will be (.*+)$/) do |arg1|
  #puts arg1
  #pending # Write code here that turns the phrase above into concrete actions
end
