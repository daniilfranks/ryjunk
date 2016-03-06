require 'net/ftp'
require 'logger'
require 'fileutils'

# TODO
# http://blog.bigbinary.com/2011/07/20/ruby-pack-unpack.html

class Runner

  def initialize(reader, transmitter, random, freq_file)
  	
  	@reader = reader
  	@transmitter = transmitter
  	@random ||= false
  	@freq_file ||= freq_file
  
  end
  
  def run 

  	# Traverse over files and sleep randomly or regular
  	@reader.files.each do | file |
  	  sleep (@random)? rand(1..10) :  @freq_file
  	  @transmitter.transmit(file)
  	end

  end 	
end

class Transmitter
  
  def initialize
  end

  def transmit(file)
  	puts "transmitting #{file}"
  end
end

class Reader
  
  attr_reader :files

  def initialize(indir=".", outdir, freq_file_fuzz, freq_fuzz_within_file)
     
    @outdir = outdir
    @freq_file_fuzz = freq_file_fuzz
    @freq_fuzz_within_file = freq_fuzz_within_file

    # TODO: look for other type of files
    @files = Dir.glob("#{indir}/*.xml")

    @outdir =  indir + '/' + @outdir 
    FileUtils.mkdir @outdir  unless File.exist?(@outdir)


    #freq_file_fuzz = (freq_file_fuzz > @files.length)? @files.length : freq_file_fuzz
    freq_file_fuzz = [freq_file_fuzz, @files.length].min
    indices = (0.. freq_file_fuzz).collect do | _ |  rand(0..@files.length-1) end
    indices.sort!.uniq!

    #puts "some file indices #{indices}"
     
    indices.each do | x | fuzz_file(@files[x]) end
  
  end

  def fuzz_file(file)
    
    #puts "fuzzing #{file}"
   
    no_of_lines = File.open(file).readlines.count
    data = File.open(file).read

    #freq_within = (@freq_fuzz_within_file > no_of_lines)? dno_of_lines : @freq_fuzz_within_file
    freq_within = [@freq_fuzz_within_file, no_of_lines].min

    indices = (0.. freq_within).collect do | _ | rand(0..no_of_lines) end

    indices.sort!.uniq! 
    #puts "row number #{indices}"

    @fh = File.open(@outdir + '/' + file, 'w') 
    
    # TODO: better than cntr?
    cntr = 0
    data.each_line do | row |          

      if cntr == indices.first
        row = fuzz_row(row)
        #TODO: done better?          
        indices = indices.drop(1)  
      end

      @fh.write(row)
      cntr+=1 

    end

    @fh.close()

  end

  def fuzz_row row

    #puts "fuzzing row ..."
    row = row.split('')
    f = rand(0..row.length)
    s = rand(0..row.length)
    row[s], row[f] = row[f], row[s]
    return row.join
   
  end

  def fuzz_row_bytes row
    
    # Randomly pick a character

    # Randomly swap bytes within a charater
    # using unpack/pack

    return row

  end

end

if __FILE__ == $PROGRAM_NAME

  # TODO: logger and exception handling? argument handling?

  # TODO: percentage of number of files and rows???

  # TODO: Different ways to fuzz? character swap today...? other methods?
   
  # TODO: daemonize and use cinch to send commands?

  reader = Reader.new(indir ='.', outdir='out', freq_file_fuzz=3, freq_fuzz_within_file=3)
  
  # Create a transmitter, e.g. ftp or PUSH or ...
  transmitter = Transmitter.new
  
  # Manage files, fuzzed and non-fuzzed and decide if they should be transfered regulary or randomly...
  runner = Runner.new(reader, transmitter, random=false, freq_file=0)
  
  # Start the show
  runner.run()

end