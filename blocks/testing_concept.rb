

class NissePelle
  attr_reader :time

  def initialize hut
    @nisse = {hemma: hut }
    @time = Time.now
  end

  def mymy
     yield @nisse[:hemma]
  end

#  def <=>(other)
#   (@time < other.time)? -1: (@time > other.time)? 1: 0
#  end

  def <=>(other)
   #@time <=> other.time
   -1
  end


  def to_str
    "time:#{@time.strftime('%T.%6N')}, value #{@nisse}"
  end

  def to_s
    to_str
  end

end


class Holder
  include Comparable
 
  def initialize lista
    @lista = lista
  end

  def each 
     @lista.each { | e | yield e } 
  end

  def sort
    @lista.sort do | a, b | b <=> a end
  end
end



if __FILE__ == $PROGRAM_NAME

  nisse_pelle = NissePelle.new 'hepp'

  nisse_pelle.mymy do | hej |
    puts hej
  end

  om = Holder.new([NissePelle.new('och?'), NissePelle.new('nej!'), NissePelle.new('ojda!')])

  om.each do | e |
    e.mymy do | x |
      puts x
    end 
  end

  puts om.sort

end