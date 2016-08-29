

class MyClass
  def self.div_with_3 arg

    raise TypeError unless arg.class == Fixnum or arg.class == Bignum

    arg.to_s.split('').map(&:to_i).reduce {|t, x| t +x } % 3 == 0

  end
end






if __FILE__ == $PROGRAM_NAME

  require 'test/unit'

  class TC_DivideByThree <Test::Unit::TestCase

    def setup
    end

    def test_valid_val
      assert_true MyClass.div_with_3(123)
    end

    def test_valid_val_zero
      assert_true MyClass.div_with_3(0)
    end

    def test_valid_val_negative
      assert_false MyClass.div_with_3(-2)
    end


    def test_valid_val_but_false
      assert_false MyClass.div_with_3(223)
    end


    def test_invalid_string
      assert_raises(TypeError) { MyClass.div_with_3("123") }
    end

    def test_invalid_array
      assert_raises(TypeError){ MyClass.div_with_3([123])}
    end
  

    def test_valid_val_very_big_false
      #assert_raises(TypeError) { MyClass.div_with_3(1231123232445353645667657567575) }
      assert_false  MyClass.div_with_3(1231123232445353645667657567575)
    end

    def test_valid_val_very_big_true
      #assert_raises(TypeError) { MyClass.div_with_3(1231123232445353645667657567575) }
      assert_true  MyClass.div_with_3(1231123232445353645667657567576)
    end


  end 

end