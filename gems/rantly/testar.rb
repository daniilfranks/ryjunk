require './l'
require 'minitest/autorun'
#require 'rantly'
require 'rantly/minitest_extensions'
class ListTest < Minitest::Test

  def test_reversing_lists
  	assert_equal "( 3 . ( 2 . ( 1 . Nil ) ) )",
  	  List.reverse(Cons.new(1, Cons.new(2, Cons.new(3)))).to_s

  	assert_equal "Nil", List.reverse(Nil.instance).to_s  

  	assert_equal "( 3 . ( 2 . ( 1 . Nil ) ) )",
      List.reverse(List.from_values(1, 2, 3)).to_s

  end

  def test_reversing_by_property

  	property_of {
  		length = range(0, 10)
  		List.from_values(array(length) {integer})
  	}.check { | list | 
      assert_equal list.to_s, List.reverse(List.reverse(list).to_s)  
  	}
  end
end  