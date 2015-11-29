require 'rubygems'
require 'factory_girl'

require_relative '../lib/models/list'
require_relative '../lib/models/node'

require_relative '../spec/factories/lists.rb'
require_relative '../spec/factories/nodes.rb'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
