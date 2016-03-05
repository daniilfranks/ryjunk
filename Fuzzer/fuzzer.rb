require 'fileutils'

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
  
  def initialize(indir=".", outdir, freq_file_fuzz, freq_fuzz_within_file)
     
    @outdir = outdir
    @freq_file_fuzz=freq_file_fuzz
    @freq_fuzz_within_file = freq_fuzz_within_file

    @directory = Dir.glob(  "#{indir}/*.xml")

    # create outdir if it do not exist
    @outdir =  indir + '/' + @outdir 
    FileUtils.mkdir @outdir  unless File.exist?(@outdir)


    freq_file_fuzz = (freq_file_fuzz > @directory.length)? @directory.length : freq_file_fuzz
    indices = (0.. freq_file_fuzz).collect do | _ |  rand(0..@directory.length-1) end
    indices.sort!.uniq!

    puts "some file indices #{indices}"
     
=begin
 @directory.each_with_index  do | file, idx |

    	puts "-->now #{idx} : #{indices[idx]}"
    	if idx == indices.first
    	  fuzz_file(file)
    	  indices = indices.drop(1) 
    	end  
    end
=end


    indices.each do | x |
    	fuzz_file(@directory[x])
    end
  
  end

  def fuzz_file(file)
    
    puts "fuzzing #{file}"
   
    no_of_lines = File.open(file).readlines.count
    data = File.open(file).read

    freq_within = (@freq_fuzz_within_file > no_of_lines)? dno_of_lines : @freq_fuzz_within_file

    indices = (0.. freq_within).collect do | _ | 	rand(0..no_of_lines) end

    indices.sort!.uniq! 
    puts "row number #{indices}"

    fh = File.open(@outdir + '/' + file, 'w') 
    
    cntr=0
    data.each_line do | row |          

      #puts "#{cntr}: #{indices.first}"

      if cntr == indices.first
      	puts "fuzzing row #{cntr}"
        row = row.split('')
        f = rand(0..row.length)
        s = rand(0..row.length)
        row[s], row[f] = row[f], row[s]
        fh.write(row.join)
        indices = indices.drop(1)
      else
      	#print '.'
        fh.write(row)  
      end

       cntr+=1 

    end

    fh.close()

  end 

  def files
    return @directory
  end
end


if __FILE__ == $PROGRAM_NAME

  # TODO: logger and exception handling? argument handling?

  # Find files in one indir and do some fuzzing on some files and put them in an outdir
  reader = Reader.new(indir ='.', outdir='out', freq_file_fuzz=3, freq_fuzz_within_file=3)
  
  # Create a transmitter, decide if it should be ftp or PUSH or whatever
  transmitter = Transmitter.new
  
  # Read files, fuzzed and non-fuzzed and decide if they should be transfered regulary or randomly...
  runner = Runner.new(reader, transmitter, random=false, freq_file=0)
  
  # Start the show
  runner.run()

end