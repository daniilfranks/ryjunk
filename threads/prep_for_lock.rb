require 'thread'

NUMBER_THREADS = 10
TEST_TIME_RANGE=(1..10)

def janne(x)
  sleep TEST_TIME_RANGE.to_a.sample
  puts "Thread #{x} starts..."
  sleep TEST_TIME_RANGE.to_a.sample
  puts "Thread #{x} ends..."
end

if __FILE__ == $PROGRAM_NAME

 hej = (1..NUMBER_THREADS).to_a.collect { | x | Thread.new { janne(x) } }.each { |thr| thr.join }

end