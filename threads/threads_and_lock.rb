#!/usr/bin/ruby
require 'thread'

#https://blog.engineyard.com/2011/a-modern-guide-to-threads
# http://www.slideshare.net/mperham/actors-and-threads
class A

   @@mutex = Mutex.new
   @@cv = ConditionVariable.new
   
   def initialize
   
   end

   def run
      @@mutex.synchronize do
         
         @@cv.wait(@@mutex)
         puts "In critical section"
         @@cv.signal
         puts "Left critical section"

      end
   end

end



mutex = Mutex.new

cv = ConditionVariable.new
a = Thread.new {
   mutex.synchronize {
      puts "A: I have critical section, but will wait for cv"
      cv.wait(mutex)
      puts "A: I have critical section again! I rule!"
   }
}

puts "(Later, back at the ranch...)"

b = Thread.new {
   mutex.synchronize {
      puts "B: Now I am critical, but am done with cv"
      cv.signal
      puts "B: I am still critical, finishing up"
   }
}
a.join
b.join



aa = A.new

aa.run
