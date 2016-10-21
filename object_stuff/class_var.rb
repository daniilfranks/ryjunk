
class Nisse
  def initialize
    @@orre ||= 42
  end
end


class Olle < Nisse

  def initialize
    super()
    puts "from Olle: #@@orre"
  end
end


class Hutte < Nisse

  def initialize
    super()
    puts "from Huttee: #@@orre"
  end
end


if __FILE__ == $PROGRAM_NAME

  puts 'the start'
  olle = Olle.new

  hutte = Hutte.new

  nu = Time.now
  sleep 2
  sen = Time.now
 
   puts sen-nu
   puts (sen-nu).class

   require 'minitest/autorun'

   class TestTimeStuff <  Minitest::Test

     def test_assert_time
       nu = Time.now
       sleep 2
       sen = Time.now

       assert_in_epsilon sen-nu, 2.0 , 0.5
     end

   end
  

end

