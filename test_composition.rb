
class BB

  def mu_method
	puts 'mu method'
  end
end

class OO
	def mu_method
		puts "oo method"
	end
end

class CC

  def initialize(v=BB)
#  	@my_obj = (v == nil)? BB.new : v.new
  	@my_obj =  v.new
  end

  def the_method
  	@my_obj.mu_method
  end

end


cc = CC.new()

print cc.the_method


dd = CC.new(OO)

print dd.the_method

require 'ruby-progressbar'

progressbar = ProgressBar.create(:starting_at => 0, :total => 10)

#progressbar = ProgressBar.new

#for i in (1..10)
#	progressbar.increment
#	sleep i
#end

#5.times do progressbar.increment; sleep 0.5 end


progressbar.finished? # => true


STDOUT.sync = true
5.times {
  print "."
  sleep 2
}

