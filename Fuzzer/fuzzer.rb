
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
  
  def initialize(indir=".", outdir=".", freq_file_fuzz=2, freq_fuzz_within_file=1)
     
     @outdir = outdir
     @freq_file_fuzz=freq_file_fuzz
     @freq_fuzz_within_file = freq_fuzz_within_file
     
     @directory = Dir.glob(  "#{indir}/*.xml")

     puts @directory

     indices = (0.. @directory.length-1).collect do | _ | 
     	rand(0..@directory.length-1) 
     end

     puts indices.sort!.uniq!

     puts "some file indices #{indices}"
     

     @directory.each_with_index  do | file, idx |
       fuzz_file(file) if idx == indices[idx]       
     end
  
  end

  def fuzz_file(file)

  	# create some random string to put in string

  	# write back to file in output directory
   
    data = File.readlines(file)

    # get  row number  from file
    sample = rand(0..data.length)
     
    puts "row number #{sample}"

    return


    cntr =0 
    File.open(file, 'w+') do | x |
           
      if cntr == sample
         x.write('random stuff') 
      end

      cntr+=1
    
    end


  end 

  def files
  
    return @directory

    return ['nisse.xml', 'pelle.xml']

  end
end



if __FILE__ == $PROGRAM_NAME

  # Find files in one indirectory and do some fuzzing and put them in an outdir
  reader = Reader.new(indir='.', outdir = '.', freq_file_fuzz=3, freq_fuzz_within_file=3)
  
  # Create a transmitter, decide if it should be ftp or PUSH or whatever
  transmitter = Transmitter.new
  
  # Read files, fuzzed and non-fuzzed and decide if they should be transfered regulary or randomly...
  runner = Runner.new(reader, transmitter, false, 3)
  
  # Start the show
  runner.run()

end