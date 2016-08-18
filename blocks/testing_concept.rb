

class NissePelle

  def initialize hut
    @nisse = {hemma: hut }
  end

  def mymy
     yield @nisse[:hemma]
  end
end


class Holder

  def initialize lista
    @lista = lista
  end

  def each 
     @lista.each { | e | yield e } 
  end

end



if __FILE__ == $PROGRAM_NAME

  nisse_pelle = NissePelle.new 'hepp'

  nisse_pelle.mymy do | hej |
    puts hej
  end

  om = Holder.new([NissePelle.new('och?'), NissePelle.new('nej!')])

  om.each do | e |
    e.mymy do | x |
      puts x
    end 
  end

end