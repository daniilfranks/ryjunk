
class Gear

  attr_reader :chainring, :gog, :wheel

  def initialize(chainring, gog, wheel=nil)
    @chainring = chainring
    @gog = gog
    @wheel = wheel
  end


  def ratio 
  	chainring / gog.to_f
  end

  def gear_inches
  	ratio * @wheel.diameter
  end	


end

class Wheel

    attr_reader :rim, :tire

    def initialize(rim: 26, tire: 1.5)
    	@rim = rim
    	@tire = tire
    end

	def diameter	
	  @rim + (@tire *2)
	end

	def circumference
	  Math::PI * diameter()  
	end
end




if __FILE__ == $PROGRAM_NAME

  @wheel = Wheel.new(rim:26, tire:1.5)
  @wheel.circumference


  Gear.new(52, 11, @wheel).gear_inches

  Gear.new(52, 11, @wheel).ratio

=begin
doctest: Test wheel and gear!
>> @wheel = Wheel.new(rim:26, tire:1.5)
>> @wheel.circumference
=> 91.106186954104
>> Gear.new(52, 11, @wheel).gear_inches
=> 137.0909090909091
>> Gear.new(52, 11, @wheel).ratio
=> 4.7272727272727275
=end


end