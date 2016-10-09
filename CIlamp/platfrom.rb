require 'fileutils'


module OS

  module_function

  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.unix?
    !OS.windows?
  end

  def OS.linux?
    OS.unix? and not OS.mac?
  end

  def get_platform
    nisse = (OS.mac?)? "Mac":(OS.linux?)? "Linux": "Windows"
  end
end

class ListAPI

  def initialize
  end

  def get_cwd
    raise NotImplementedError
  end
end

class ListAPILinux< ListAPI

  def initialize
  end

  def get_cwd

    return FileUtils.pwd()
  end

end

class Platform
  include OS

  def initialize 
  operativ = {'Linux' => ListAPILinux.new, 'Mac' => ListAPILinux.new, 'Windows' => ListAPILinux.new }
 

    @here = operativ.fetch(get_platform)  
  end

  def get_cwd
    @here.get_cwd
  end

end

if __FILE__ == $0
  
  platform = Platform.new

  puts platform.get_cwd

  
end
