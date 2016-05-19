require 'rr'


class MyClass

  def foo b,n
    return 'nisse'
  end

end

require 'test/unit'

class TC_MyTest < Test::Unit::TestCase
   include RR::Adapters::TestUnit
   def setup
     @my_class = MyClass.new
   end

  # def teardown
  # end

  def test_first
    stub(@my_class).foo(1, 2) { 'bar' }
    assert_equal  @my_class.foo(1,2), 'bar'
  end

  def test_second
#    stub(@my_class).foo(1, 2) { 'bar' }
    assert_equal  @my_class.foo(2,2), 'bar'
  end

end
