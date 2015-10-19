
module Before
  puts 'Before'
end

module After
  puts 'After'
end


class Example
  include Before
  prepend After
  def initialize
    puts 'Init'
  end

  def test
    puts 'test'
  end
end



e = Example.new


#puts e

puts e.test