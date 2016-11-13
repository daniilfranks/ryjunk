
require 'find'

class Expression
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


if __FILE__ == $PROGRAM_NAME

  expr_dtd = Not.new(FileName.new("*.mp3"))

  puts expr_dtd.evaluate('.')
  

end
