require_relative 'platform'

class Commands
  include OS
  class << self
  	attr_reader :os_classes
  end

  @os_classes = []

  def self.list_files(path)

  	os = os_for(path)
  	raise "No list files for this os!" unless os
  	os.list_files(path)
  end

  def self.play_sound(path)

  	os = os_for(path)
  	raise "No sound for this os!" unless os
  	os.play_sound(path)
  end


  def self.os_for(path)
  	os_class = Commands.os_classes.find do | klass |
  		klass.current_os?
  	end

  	return os_class.new if os_class
  	nil
  end
  
  def self.inherited(subclass)
  	Commands.os_classes << subclass
  end
end

class Linux < Commands
	def self.current_os?
    OS::get_platform == :Linux
	end

	def list_files(path)
		system("ls #{path}")
	end
  
  def play_sound(path )
    system("mpg123 #{path} > /dev/null 2>&1")
  end
end

class Mac < Commands
	def self.current_os?
    OS::get_platform == :Mac
	end

	def list_files(path)
	  system("ls #{path}")
	end
  
  def play_sound(path )
    system("afplay #{path}")
  end
end


if __FILE__ == $PROGRAM_NAME

  include OS

  #Commands.list_files('.')
  Commands.play_sound('./success.mp3')

end
