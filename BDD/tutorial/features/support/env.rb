
# https://github.com/cucumber/cucumber/wiki/Hooks

require_relative '../domain/domain'


Before do
   puts 'Before!!!'
   @kalle = 0
   @nisse = Nisse.new
   
end



After do |s| 
  puts 'After!!!'
  # Tell Cucumber to quit after this scenario is done - if it failed.
  Cucumber.wants_to_quit = true if s.failed?
end
