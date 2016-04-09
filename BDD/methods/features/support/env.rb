require 'rspec'

class Kulla
  include RSpec::Matchers

  def maffe *n
  
     puts n.class
     puts n
 #   puts nn.class

#    nn.each do | x, y |
#      puts "#{x} : #{y}"    
#    end

    return 3
  end

end

module KLJ


  def palle
    puts 'jjjj'
    @palle ||= Kulla.new
  end

end



World(KLJ)
