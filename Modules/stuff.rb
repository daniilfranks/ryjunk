module Stuff  
  C = 10  
  def Stuff.m(x)  # prefix with the module name for a class method  
    C*x  
  end  
  def p(x)        # an instance method, mixin for other classes  
    C + x  
  end  
  class T  
    @t = 2  
  end  

  def Stuff.pelle
     return ENV['NISSE']
  end
end  
