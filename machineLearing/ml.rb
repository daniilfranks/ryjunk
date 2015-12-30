
class NumberGuesser
  
  "Guesses numbers based on the history of your input"
  
  def initialize
    @guessed_numbers = []
  end

  def number_were(guessed_numbers)
    @guessed_numbers += guessed_numbers
  end

  def number_was(guessed_number)
    @guessed_numbers << guessed_number
  end

  def guess
     
    return nil if @guessed_numbers == []

    return @guessed_numbers.sample

  end

end




if __FILE__ == $PROGRAM_NAME

require 'test/unit'


class TC_Number_Guess < Test::Unit::TestCase

  def test_given_a_one_off_observation_followed_by_a_set_of_observations__test

    # Given
    number_guesser = NumberGuesser.new
    previously_chosen_numbers = [1,2]
  
    one_off_observation = 0
    all_obervations = previously_chosen_numbers + [one_off_observation]
 
    number_guesser.number_was(one_off_observation)
    number_guesser.number_were(previously_chosen_numbers)
  
    # When
    guessed_numbers = (0..100).collect do | _ | number_guesser.guess() end 

    # Then
    guessed_numbers.each do | guessed_number | 
      assert_includes all_obervations, guessed_number, 
      "Every guess should be one of the previously chosen numbers" 
    end

    assert_equal (guessed_numbers.uniq!).length, all_obervations.length,
     "It should eventually guess every number at least once"

  end

end


end