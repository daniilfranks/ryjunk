
require 'test/unit'


class Perceptron

  def predict
    return nil
  end

end



if __FILE__ == $PROGRAM_NAME

  class TC_Perceptron < Test::Unit::TestCase

    def assert_nil arg
      assert_equal nil, arg
    end

    def no_training_data_supplied_test
      the_perceptron = Perceptron.new
      result = the_perceptron.predict
      assert_nil result, "Should have no result with no training data"
    end

  end

end
