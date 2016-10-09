require 'blinky'

#TODO make each a presenter a thread so they can work in parallel!
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

  def update(time, result) # callback for observer
    show result
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
  require_relative './platfrom'

  class Presenter < UberPresenter

    def initialize resulter
      puts "operative system: #{OS.get_platform}:"
      @the_api = TheAPI.pick(OS.get_platform)

      super(resulter)

    end

    def show result
      #puts "hi from Sound guy...#{result}"

      # TODO: Hold if already playing, otherwise go on
      @the_api.play_mp3(mode = result)

    end

  end
end

module StdOut
  class Presenter < UberPresenter
    def initialize resulter
      puts 'stdout started'
      super(resulter)
    end

    def show result
      puts result
    end

    def ooupdate(time, result) # callback for observer
      print "#{self.class}:"
      show result
    end

  end
end
