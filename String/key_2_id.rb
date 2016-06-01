


class Key2Id

  attr_reader :id
 
  def initialize key
    @key = key
    the_split 
  end

  def the_split
    raise "to few fields #@key" unless @key.split(':').size == 3
    @id = @key.split(':').last
  end

  def to_s
    to_str
  end

  def to_str
    @key
  end

end


if __FILE__ == $PROGRAM_NAME

  @external = Key2Id.new("1:7:9")

  puts @external

  puts @external.id

  @external = Key2Id.new("")

  puts @external

  puts @external.id


end