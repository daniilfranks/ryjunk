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
    this = File.size(@filepath)
    other =  File.size(moved_file.filepath)
    (this  < other )? -1: (this  > other )? 1: 0
  end


end

SRCDIR = './nisse'
INDIR = SRCDIR + '/**/*'
DESTDIR = './outdir/'

if __FILE__ == $PROGRAM_NAME

  # Populate the file_object list ...
  file_objects = Dir.glob(INDIR).collect { | x |  EnFil.new(x) }

  # Print md5 chksum for all files ...
  file_objects.each { | x |  x.md5sum }

  # Move all files to a new directory
  # How to move a file object? Should the operation
  # be part on the object ...
  out_dir_array = file_objects.collect { | x |  EnFil.new(DESTDIR + x.filename) }

  # Verify that there's no file left srcdir
  #file_objects.each { | x |  x.check(SRCDIR) }

  # Verify that there's a file in destdir, md5sum
  file_objects.each_with_index do | x, idx |
     
     # Compare the srcfiles with destfiles 
     raise "Not equal #{x.filename} :: #{out_dir_array[idx].filename}" unless x == out_dir_array[idx]
  end
end