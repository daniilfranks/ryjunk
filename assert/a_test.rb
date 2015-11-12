require 'rspec'
require 'ramcrest'

class Nisse

end

describe Nisse do
  include Ramcrest::HasAttribute
  include Ramcrest::IncludesExactly

  it "only knows the funky chicken by default" do
    assert_that Nisse.new, has_attribute(:dances, includes_exactly(:funky_chicken))
  end
end