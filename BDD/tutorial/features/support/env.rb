
# https://github.com/cucumber/cucumber/wiki/Hooks

require_relative '../domain/domain'

module HelpMe

  @orvar = 12345

end

Before do
   puts 'Before!!!'
   @kalle = 0
   @nisse = Nisse.new
   #puts self.public_methods
end

World(HelpMe)

After do |s| 
  puts 'After!!!'
  # Tell Cucumber to quit after this scenario is done - if it failed.
  Cucumber.wants_to_quit = true if s.failed?
end

AfterStep do |s| 
  puts 'AfterStep!!!'
end
