

class NissePelle

  def initialize
    @nisse = {hemma: 'orvar'}
  end

  def mymy
     yield @nisse[:hemma]
  end
end




if __FILE__ == $PROGRAM_NAME

  nisse_pelle = NissePelle.new

  nisse_pelle.mymy do | hej |
    puts hej
  end

end