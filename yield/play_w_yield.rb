

class Abbe

  def my_block
    orvar = {olle:1}
  end

  def mera( &that_block )
    that_block.call
    puts orvar
  end

end

class Ebbe
end


if __FILE__ == $PROGRAM_NAME

  abbe = Abbe.new

  abbe.mera(abbe.my_block)

end