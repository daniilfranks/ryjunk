require_relative 'platfrom'



class PlateForm
  include OS
  class << self
  	attr_reader :os_classes
  end

  @os_classes = []

  def self.list_files(path)

  	os = os_for(path)
  	return nil unless os
  	os.list_files(path)
  end


  def self.os_for(path)
  	os_class = PlateForm.os_classes.find do | klass |
  		klass.current_os?
  	end

  	return os_class.new if os_class
  	nil
  end
  
  def self.inherited(subclass)
  	PlateForm.os_classes << subclass
  end
end

class Linux < PlateForm
	def self.current_os?
      get_platform == "Linux"
	end

	def list_files(path)
		puts system("ls #{path}")
	end
end


if __FILE__ == $PROGRAM_NAME

  include OS
  #plateform = PlateForm.new

  #puts OS::get_platform
  PlateForm.list_files('.')

end