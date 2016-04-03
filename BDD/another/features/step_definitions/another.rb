require_relative './station' 

When(/^we ask for the full name for "(.*?)"$/) do |arg1|
    @station = loadStationFactory[arg1]
    puts "#{@station.inspect}"
  end
  
  Then(/^we are told it is "(.*?)"$/) do |arg1|
  	puts "#{@station.inspect}"
    expect(@station.getFullName).to eq(arg1)
  end
  
  Then(/^we are also told it had (\d+) passengers$/) do |arg1|
    expect(@station.getPassengers).to eq(arg1.to_i)
  end
