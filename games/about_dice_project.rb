
# Implement a DiceSet Class here:
#
class DiceSet

  attr_reader :values

  def initialize
    @values = []
  end

  def _roll
    return rand(1..6)
  end

  def roll number

    @values = []
    number.times do | _ |
      @values << _roll
    end

    return @values

  end


end
