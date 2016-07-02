require 'event_emitter'

class Timer
  include EventEmitter

  def start(sec, count)
    count.times do
      sleep sec
      emit :tick
    end
    emit :end
  end
end

timer = Timer.new

timer.on :tick do
  puts Time.now
end

timer.once :tick do
  puts "timer start"
end

timer.on :end do
  puts "timer end"
end

timer.start 1, 5
