require 'yaml'
require 'net/ftp'
require 'logger'
require 'fileutils'

require_relative 'tp.rb'
require_relative 'my_config'
require_relative 'reader'
require_relative 'transmitter'

class Runner

  #def initialize(reader, transmitter, random=nil, freq_file=nil)
  def initialize(reader: DummyReader.new , 
  	             transmitter: DummyTransmitter.new, 
  	             random: nil, freq_file: nil)
  	  	
  	@reader = reader
  	@transmitter = transmitter
  	@random ||= false
  	@freq_file ||= 0
  
  end
  
  def run 

  	# Traverse over files and sleep randomly or regular
  	@reader.files.each do | file |
  	  sleep (@random)? rand(1..10) :  @freq_file
  	  @transmitter.transmit(file)
  	end
  end 

  def checkRep
    assert_not_nil @reader
  end

end

# TODO: Use different fuzzers, readers[tokenswapper](arguments) ...
#readers = {:dummy => DummyReader, :tokenswapper => Reader.new,
#           :byteswapper => Byter.new}

#transmitters = {"dummy" => DummyTransmitter.new, "transmitter" => Transmitter.new}
if __FILE__ == $PROGRAM_NAME

  # TODO: - logger
  #       - percentage of number of files and rows?
  #       - daemonize and use cinch to send communicate?   

  begin


    c           =  MyConfig.new
    reader      = (c.dummyr)? DummyReader.new : 
                         Reader.new(indir =c.indir, outdir=c.outdir, 
  	                     freq_file_fuzz=3, freq_fuzz_within_file=3)
  
    puts "hejopp:", c.dummyt
    transmitter = (c.dummyt)? DummyTransmitter.new : 
                              Transmitter.new(c.site, c.user, c.passwd)
  
    #transmitter = transmitters[c.dummyt]

    $invariants.enable do

      runner      = Runner.new(reader: DummyReader.new, random: false, freq_file: 0)
  
      # Start the show
      runner.run()
    end
  rescue => msg
    puts msg
    puts msg.backtrace
  end

end