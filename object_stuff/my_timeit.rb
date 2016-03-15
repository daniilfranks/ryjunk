require 'pp'

class C

  def initialize
    @olle = 43
  end
  def self.slow n
    return C.fast if n == 0
    sleep 1
    slow n-1
  end

  def self.fast
  end
end

@times = {}

traceCall = TracePoint.new(:call, :return) do |tp|

  puts tp.self.instance_variable_defined?(:olle)
  #puts tp.self.instance_variable_get("olle")
  key = "#{tp.defined_class}_#{tp.method_id}_#{caller(0).size}"
  if tp.event == :call
    @times[key] = Time.now
  else
    @times[key] = Time.now - @times[key]
  end
end.enable do
  C.slow 3
end

@times.each do | k, v |
  puts k, v
end