# http://www.saturnflyer.com/blog/jim/2015/01/20/ruby-forwardable-deep-dive/

require 'forwardable'

class Address
  def initialize
    @street, @city, @state = 0,0,0
  end

  attr_accessor :street, :city, :state

end

class Person

  attr_accessor :address
  extend Forwardable
  delegate [:street, :city, :state] => :address
#  delegate :street, :city, :state => :address

  def initialize
    self.address = Address.new
  end
end


if __FILE__ == $PROGRAM_NAME

  require 'test/unit'

  class TC_Forward < Test::Unit::TestCase

    def setup
      @person = Person.new
      @person.street ="langa vagen"
      puts "hej hopp: #{@person.street}"
    end

    def test_neq
    end 

    def test_ge
      #assert_operator @s1,:<,  @s2
    end 

    def test_lt
      #assert_operator @s2,:>,  @s1
    end 

  end
  
end