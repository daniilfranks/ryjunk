Given(/^I create new user named "([^"]*)" with the following data:$/) do |arg1, table|
  # table is a Cucumber::Core::Ast::DataTable
  #pending # Write code here that turns the phrase above into concrete actions
  table.hashes.each do | x | 
   puts 'hej:'
   puts x end
end
