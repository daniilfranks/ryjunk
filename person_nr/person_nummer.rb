=begin

https://www.skatteverket.se/privat/folkbokforing/personnummer/personnumretsuppbyggnad.4.18e1b10334ebe8bc80001502.html

1. Siffrorna i födelsetiden och födelsenumret multipliceras växelvis med 2 och 1.

6 4 0 8 2 3 – 3 2 3
2 1 2 1 2 1    2 1 2
12,4,0,8,4,3, 6,2,6

sum: [12, 4, 0, 8, 4, 3, 6, 2, 6]

2. Lägg ihop siffrorna i produkterna. Obs! 12 räknas som 1+2 
1+2+4+0+8+4+3+6+2+6=36

3. Entalssiffran (6) i siffersumman dras från talet 10. 10-6=4. 

Restsiffran (4) blir kontrollsiffra vilket gör att personnumret i exemplet blir 640823-3234. Är restsiffran 10, blir kontrollsiffran 0.

=end

class GeneratePersonNumber

  attr_reader :person_number, :female

  def initialize(date)
     @date = date
     error_check    

     @almost = date.split('')
     calc_control_number
     check_gender
  end

  def error_check
     raise "invalid size" unless @date.size == 9
     raise "invalid tokens" unless @date =~ /\d{9}/
  end

  def calc_control_number
    pattern = [2,1,2,1,2,1,2,1,2]
    c = 0
    @almost.zip(pattern) { |x, y|
       tmp = x.to_i * y.to_i 
       c += tmp < 10 ? tmp : (tmp%10 + tmp/10)
     }

     @control = 10 - c%10
     @person_number = "#@date#@control" 
  end
 
  def check_gender
     @female = @person_number[8].to_i.odd?
  end

end


if __FILE__ == $PROGRAM_NAME

  require 'date'
  require 'minitest/autorun'

  class TestGeneratePersonNumber < Minitest::Test

    def setup
      @person_nr = GeneratePersonNumber.new("640823323")
    end

    def test_valid_chk_number
       assert_equal "6408233234", @person_nr.person_number
    end

    def test_female
       assert @person_nr.female
    end


    def test_too_short
      assert_raises(RuntimeError){ GeneratePersonNumber.new("64082332") }
    end

    def test_too_long
      assert_raises(RuntimeError){ GeneratePersonNumber.new("6408233212") }
    end

    def test_all_not_numbers1  # a b
      assert_raises(RuntimeError){ GeneratePersonNumber.new("64082332a") }
    end

    def test_all_not_numbers2  # - , _
      assert_raises(RuntimeError){ GeneratePersonNumber.new("64082332-") }
    end
  end

  class TestGeneratePersonNumber2 < Minitest::Test

    def setup
      t1 = Date.parse("1915-11-16")
      t2 = Date.parse("2015-11-20")
      nisse = rand(t1..t2)
      stringen = nisse.strftime('%y%m%d')
      last_nr = rand(0..999).to_s
      almost = stringen + last_nr
      @person_nr = GeneratePersonNumber.new(almost)
    end

    def test_valid_number
       refute_nil @person_nr.person_number
    end

    def test_either_true_or_false
       assert_includes [true,false],  @person_nr.female
    end

  end
end