

#require 'stringio'
require 'stringio'


class Builder
  def initialize filename

  	@filename = filename

  	#read_it

  end

  def read_it
     fh = File.open @filename 
     read_it_fh fh
  end

  def read_it_fh  fh
  	@data = fh.read
  	puts @data
  end

end



builder = Builder.new('nisse.txt')
builder.read_it

my_fh = StringIO.new('du da du da')

builder.read_it_fh my_fh


kalle = [1,2]

kalle.collect do | x | puts 'hej';  puts 'hopp!' end






