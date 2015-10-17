
require 'thread'
require 'singleton'

def list

  ll = Dir.glob(['*.rb', '*.gz'])

  puts ll
end


class Nisse

	include Singleton

    attr_writer :freq

	def initialize
		puts 'Hej från Nisse', self.object_id
	end

	def run
		while true 
	      puts 'Hej igen från Nisse',self.object_id
	      sleep @freq 
	    end
	end
end

class Janne

#  @@nisse ||= Nisse.instance

  @@nisse = Nisse.instance
  @@nisse.freq = 2
  def initialize
  	trad = Thread.new { @@nisse.run }
  	puts 'Hej från Janne'
  	sleep 10
  	Thread.kill(trad)
    puts trad.alive?
  end

end



if __FILE__ == $0

  nn = [Janne.new, Janne.new]
  all  = nn.each do | x | Thread.new { x } end
  sleep 1
end
