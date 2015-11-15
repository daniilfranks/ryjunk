
# http://www.jonathanhui.com/ruby-built-variables-modules-constants

puts global_variables.sort



puts "Built-in constants"

all = Module.constants.sort.reject{ |x|
  eval(x.to_s).is_a? Module
}
p all


puts "Built-in Modules"

all = Module.constants.sort.select { |x|
   eval(x.to_s).instance_of? Module
}

p all


puts "Built-in Classes"

all = Module.constants.sort.select { |x|
   obj = eval(x.to_s)
   obj.is_a? Class and not obj.ancestors.include? Exception
}

p all




