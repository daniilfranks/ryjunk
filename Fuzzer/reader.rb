

# TODO
# http://blog.bigbinary.com/2011/07/20/ruby-pack-unpack.html

  # TODO: Different ways to fuzz? character swap today...? other methods?

class DummyReader
  attr_reader :files

  def initialize
    puts 'Starting DummyReader'
    @files = ['janne.xml', 'pelle.xml', 'olle.xml']
  end  

  def fuzz_file(file)
    puts "fuzzing file #{file}"
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
