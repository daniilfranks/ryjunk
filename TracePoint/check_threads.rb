require 'thwait'
require 'thread'

measure = TracePoint.new(:call,:return, :thread_begin, :thread_end) do |tp|
#measure = TracePoint.new(:thread_begin, :thread_end) do |tp|

   p "lineno, class, method, event"
   p [tp.lineno, tp.defined_class, tp.method_id, tp.event]

end


class A

  def initialize
  end

  def run
    a = rand(0..1)
    puts "Will sleep in #{a}"
    sleep a
  end

end




if __FILE__ == $PROGRAM_NAME

  measure.enable

  a = A.new
  b = A.new
  puts 'starting'

  thds = Array.new

  thds <<  Thread.new { a.run}
  thds <<  Thread.new { b.run}

  #thds.each do | t | t.join; puts "#{t}" end

 ThreadsWait.all_waits(thds) do |t|
   STDERR.puts "Thread #{t} has terminated."
  end

  puts 'the end'
end