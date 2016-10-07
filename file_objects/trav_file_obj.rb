require 'digest'
require 'fileutils'

class EnFil
  include Comparable
  attr_reader :md5sum, :destdir, :filename, :filepath

  def initialize(filepath)
    @filename = File.basename(filepath)
    @filepath = filepath
    @md5sum = Digest::MD5.file filepath
  end

  def mv(destdir)
    @destdir = destdir
    FileUtils.mkdir(destdir) unless File.exists?(destdir)
    FileUtils.cp_r(@filepath, destdir) 
  end

  def check(dir)
  end

  def <=>(moved_file)
#    (self.size < moved_file.size)? -1: (self.size > moved_file.size)? 1: 0
     puts File.size(@filepath)
     puts File.size(moved_file.filepath)
    (File.size(@filepath) < File.size(moved_file.filepath))? -1: (File.size(@filepath) > File.size(moved_file.filepath))? 1: 0
  end


end

SRCDIR = './nisse'
INDIR = SRCDIR + '/**/*'
DESTDIR = './outdir/'

if __FILE__ == $PROGRAM_NAME


  file_objects = []

  out_dir_array = []

  # Populate the file_object list ...
  Dir.glob(INDIR).each { | x | file_objects << EnFil.new(x) }

  # Print md5 chksum for all files ...
  file_objects.each { | x |  x.md5sum }

  # Move all files to a new directory
  # How to move a file object? Should the operation
  # be part on the object ...

  file_objects.each { | x | 
    out_dir_array << EnFil.new(DESTDIR + x.filename) }

  # Verify that there's no file left srcdir
  #file_objects.each { | x |  x.check(SRCDIR) }

  # Verify that there's a file in destdir, md5sum
  file_objects.each_with_index do | x, idx |
     # Compare the srcfiles with destfiles 
     raise "Not equal #{x.filename} :: #{out_dir_array[idx].filename}" unless x == out_dir_array[idx]
  end

end