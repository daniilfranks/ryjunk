# http://simonecarletti.com/blog/2009/12/inside-ruby-on-rails-delegate/
require 'forwardable'

class QueueManager

  extend Forwardable

  attr_accessor :queue

  # Delegates some methods to the internal queue
  delegate [:size, :clear, :push] => :queue

  def initialize
    self.queue = []
  end

end


if __FILE__ == $PROGRAM_NAME

  require 'test/unit'

  class TC_QMgt < Test::Unit::TestCase

    def setup
      @qmgr = QueueManager.new
    end

    def test_neq
      assert_equal(0, @qmgr.size) 
    end 

    def test_ge
     assert_equal([], @qmgr.clear) 
    end 

    def test_lt
     @qmgr.push 2
     assert_equal(1, @qmgr.size) 
    end 

  end
  
end