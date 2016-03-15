
# http://mauricio.github.io/2015/01/12/implementing-enumerable-in-ruby.html

class ArrayWrapper

  include Enumerable

  def initialize(*items)
    @items = items.flatten
  end

  def each(&block)
    @items.each(&block)
    self
  end

  def ==(other)
    @items == other
  end

end


if __FILE__ == $PROGRAM_NAME

  aw = ArrayWrapper.new([3,4], [5,1])

  puts aw.sort
end
