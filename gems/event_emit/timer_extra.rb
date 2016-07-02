require 'event_emitter'

class Timer
  include EventEmitter
  attr_reader :trasten

  def initialize

    self.on :tick do
      puts 'tick'
    end

  end

  def start(sec: 1, count: 5)

    @ended = false

    count.times do
      sleep sec
#      emit :tick
      puts 'tick'
      emit :me if 1 == rand(0..10)
    end

#    emit :end
   
    @ended = true

  end

  def trast

   @trasten = false

   self.on :me do
     @trasten = true
     puts 'hej hej'
     return
   end

   start

   idle until @ended

  end

  def idle ; end

end


if __FILE__ == $PROGRAM_NAME

  timer = Timer.new

  timer.trast

  puts timer.trasten.to_s
end
