

# Inherit or composition? or delegation?
class DummyTransmitter

  def initialize
  	puts 'Running DummyTransmitter '
  end

  def transmit(file)
  	puts "transmitting #{file}"
  end

end


class Mover 

  def initialize(dir=nil)
  	puts 'Running Mover'
  	@dir ||= Dir.mktmpdir
  	ObjectSpace.define_finalizer(self, self.class.method(:finalize))
  end

  def transmit(file)
  	FileUtils.copy(file, @dir)
  end

  def finalize
  	puts "remove the directory"
    FileUtils.remove_entry @dir
  end
end

class Transmitter
  
  def initialize(site, user, passwd)
  	puts 'Running Transmitter'
  	@ftp = Net::FTP.new(site)
    @ftp.login(user = user, passwd = passwd)
    puts @ftp.system

  end

  def transmit(file)
  	puts "transmitting #{file}"
  
  	@ftp.put(file)
  end
end