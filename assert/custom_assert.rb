

  require 'test/unit'

  class TC_Custom < Test::Unit::TestCase

    def assert_eq_im(expected, number)
      assert_block("Expected #{number.imaginary} to be equal to #{expected.imaginary}") do
       number.imaginary == expected.imaginary
      end
    end

    def assert_neq_re(expected, number)
      assert_block("Expected #{number.real} to be equal to #{expected.real}") do
       number.real != expected.real
      end
    end

    def setup
      @c1 = Complex(1,2)
      @c2 = Complex(3,2)
    end

    def test_object
      assert_instance_of(Complex, @c1)
    end 

    def test_eq_im
      assert_eq_im(@c1, @c2)
    end 

    def test_neq_re
      assert_neq_re(@c1, @c2)
    end 

    def test_eq
      assert_equal 10, 10
    end

  end
