  require 'minitest/autorun'

  class TestMiniTst < Minitest::Test

    def setup

    end

    def test_operator1
      assert_operator 3, :<=, 4
    end

    def test_operator2
      assert_operator 4, :<=, 4
    end

    def test_operator3
      assert_operator 5, :>=, 4
    end


  end