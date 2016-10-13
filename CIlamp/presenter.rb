require 'blinky'

# TODO add chirp?

class PresenterBuilder

  def self.get(presenter, resulter)
    return Module.const_get(presenter)::Presenter.new(resulter)
  end
end


class UberPresenter

  def initialize resulter
    resulter.add_observer(self)
  end

end

module Blinky
  class Presenter < UberPresenter

    def initialize resulter
      puts 'blinky started'
      @light = Blinky.new.light
      super(resulter)
    end

    def show result

      puts "blink got it! #{result}"

      case result
        when "success"
          @light.success!

        when "running"
          @light.building!
        when "failure"
          @light.failure!
        else
          # TODO: log
          @light.warning!
      end

    end
  end
end

module Sound
   require_relative './commands'
  class Presenter < UberPresenter

    def initialize resulter
      super(resulter)

    end

    def update time, result
      puts "hi from Sound guy...#{result}"
  
       # TODO: temporary!!!
      # TODO: Hold if already playing, otherwise go on
      Commands.play_sound("./#{result}.mp3")
    end
  end

end

module StdOut
  class Presenter < UberPresenter
    def initialize resulter
      puts 'stdout started'
      super(resulter)
    end

    def update time,  result
      puts result
    end
  end
end
