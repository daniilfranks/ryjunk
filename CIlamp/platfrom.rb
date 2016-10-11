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
    (OS.mac?)? :Mac:(OS.linux?)? :Linux: :Windows
  end
end

if __FILE__ == $PROGRAM_NAME
  
  puts "::#{OS::get_platform}::"

end
