@times = {}
traceCall = TracePoint.new(:call, :return) do |tp|
  #key = "#{tp.defined_class}_#{tp.method_id}_#{caller(0).size}"
  key = "#{tp.method_id}_#{caller(0).size}"

  if tp.event == :call
    @times[key] = Time.now
  elsif (tp.event == :return) and @times.key?(key)
    @times[key] = Time.now - @times[key]
  end
end