gem 'aspectr'
require'aspectr'

class Verbose < AspectR::Aspect
  def describe(method_sym,object,*args)
    "#{object.inspect}.#{method_sym}(#{args.join(",")})"
  end

  def before(method_sym,object,return_value,*args)
    puts"About to call #{describe(method_sym,object,*args)}."
  end

  def after(method_sym,object,return_value,*args)
    puts"#{describe(method_sym,object,*args)} has returned "+
      return_value.inspect+'.'
  end
end

verbose=Verbose.new
stack=[]
verbose.wrap(stack,:before,:after,:push,:pop)

stack.push(10)
# About to call [].push(10).
# [10].push(10) has returned [[10]].

stack.push(4)

# About to call [10].push(4).
# [10, 4].push(4) has returned [[10, 4]].

stack.pop

# About to call [10, 4].pop().
# [10].pop() has returned [4].