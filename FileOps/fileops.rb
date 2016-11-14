
require 'find'



class Expression
  def | (other)
    Or.new(self, other)
  end

  def ! (other)
    Not.new(other)
  end

end

class All < Expression
  def evaluate(dir)
    results = []
    Find.find(dir) do | p |
      next unless File.file?(p)
      results << p
    end 
    results
  end
end

class FileName < Expression

  def initialize(pattern)
    @pattern = pattern
  end

  def evaluate(dir)
    results = []
    Find.find(dir) do | p |
      next unless File.file?(p)
      name = File.basename(p)   
      results << p if File.fnmatch(@pattern, name)
    end 
    results
  end
end

class Not < Expression

  def initialize(expression)
    @expression = expression
  end

  def evaluate(dir)
    All.new.evaluate(dir) - @expression.evaluate(dir)
  end  

end

class Or < Expression

  def initialize(expression1,expression2)
    @expression1, @expression2 = expression1, expression2
  end

  def evaluate(dir)
    result1 = @expression1.evaluate(dir)
    result2 = @expression2.evaluate(dir)
    (result1 + result2).sort.uniq
  end  

end


if __FILE__ == $PROGRAM_NAME

  expr_dtd = Not.new(FileName.new("*.mp3"))

  puts expr_dtd.evaluate('.')
  
  

end
