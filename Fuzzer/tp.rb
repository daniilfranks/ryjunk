require "test/unit/assertions"
include Test::Unit::Assertions

module Invariants

@invariants = TracePoint.new(:call,:return) do |tp|

  # Be sure that checkRep included as method
  assert tp.self.respond_to?(:checkRep), "No checkRep defined in: #{tp.defined_class}"

  if tp.method_id != :checkRep and not 
    (tp.method_id == :initialize and tp.event == :call)  
   
      tp.self.send(:checkRep)
  end  
end

def Invariants.get_invariants
  return @invariants
end

end
