
require 'test/unit'


class Perceptron

  def initialize
    @weight_1 = 0.20
    @weight_2 = 0.20
  end

  def train(inputs, label)
    input = inputs[0]
    weight_1 = weight_1 + 0.25 * (input[0] - label[0] * predict(input)
    weight_2 = weight_2 + 0.25 * (input[1] - label[0] * predict(input)
  end

  def predict
    if input.length == 0
      return nil
    end

    return < @weight_1 * input[0] + @weight_2 * input[1]
  end

end


if __FILE__ == $PROGRAM_NAME

  require 'test/unit'

  puts 'hej hopp'

  class TC_Perceptron < Test::Unit::TestCase

    def assert_nil arg, str
      assert_equal nil, arg, str
    end

    def test_no_training_data_supplied_test
      
      the_perceptron = Perceptron.new
      result = the_perceptron.predict
      assert_nil result, "Should have no result with no training data"
    end


    def test_train_an_OR_function_test

      the_perceptron = Perceptron([1,1], 1)
      assert_equal  the_perceptron.predict([1, 1], 1) 

    end

   end

end
