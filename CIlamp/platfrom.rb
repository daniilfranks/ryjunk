
module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.unix?
    not OS.windows?
  end

  def OS.linux?
    OS.unix? and not OS.mac?
  end

  def OS.get_platform
    nisse = (OS.mac?)? :Mac:(OS.linux?)? :Linux : :Windows
  end

  def OS.ng_get_platform
    # something with Hash  { OSmac? => :Mac, etc?}, possible? or case?
  end

end

class ListAPI

  def initialize
  end

  def play_mp3 file, mode
    raise NotImplementedError
  end
end

# TODO: how to use a better way than abs apth with daemons?
PATH = "/Users/fabv/ehea-fabv-project/usbLamp/blinky/"

class ListAPILinux< ListAPI

  def initialize
    super()
  end

  def play_mp3(file = "cartoon-computer_ds.mp3", mode)

    case mode
      when "success"
        system("afplay #{PATH}success.mp3")
      when "building"
        system("afplay #{PATH}buildning.mp3")
      when "failure"
        system("afplay #{PATH}failure.mp3")
      else
        system("afplay #{PATH}others.mp3")
    end
  end

  def old_play_mp3(file = "cartoon-computer_ds.mp3", mode)

    puts "->>>#{@config}"

    case mode
      when "success"
        system("afplay success.mp3")
      when "building"
        system("afplay buildning.mp3")
      when "failure"
        system("afplay failure.mp3")
      else
        system("afplay others.mp3")
    end
  end
end

class Platform
  include OS

  def initialize

  operativ = {:Linux => ListAPILinux.new, :Mac => ListAPILinux.new, :Windows => ListAPILinux.new }
 

    @here = operativ.fetch(get_platform)  
  end

  def play_mp3 mode
    @here.play_mp3(mode=mode)
  end

end

class TheAPI

  def self.pick(platform)

    nn = { :Linux => ListAPILinux.new, :Mac => ListAPILinux.new }
    nn.default = 'Nej!!'
    return nn[platform]
  end

end

class NewPlatform

  def initialize

    @the_api = TheAPI.pick(OS.get_platform)
  end

end

if __FILE__ == $PROGRAM_NAME

  #config = {"sounds" => { 'success' => "success.mp3" } }
  
  #platform = Platform.new
  #platform = Platform.new

  #platform.play_mp3(mode="success")

  @the_api = TheAPI.pick(OS.get_platform)

  @the_api.play_mp3(mode="building")

end