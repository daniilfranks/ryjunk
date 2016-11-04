
# VILO RDY 100.dtd
def get_dtd_msg_type(name)

 filename = File.basename(name)
 olle = filename.match(/(?<game>[\w]{4})(?<msg>[\w]{3})(?<rrr>[\w\d\.]+)/)
 puts  olle[:msg]
 puts  olle[:game]
 return olle[:msg]
end

class FileFromSystem

  attr_reader :datum, :msg

  def initialize filename
    @filename = filename
    parse_filename
  end

  def parse_filename
    nisse = @filename.match(/(?<datum>[\d]{7})(?<game>[\w]{4})(?<msg>[\w]{3})(?<src>[\w]{3})(?<dst>[\w]{3})(?<rrr>[\w\d\.]+)/)
    @datum = nisse[:datum]
    @msg = nisse[:msg]
  end

  def <=> other
  end

end

class FilesFromSystem

  attr_reader :files

  include Enumerable

  def initialize
    @files = []
  end
  
  def<<(item)
    @files << FileFromSystem.new(item)
  end

  def each
  end

end


class DummyCarrier

  def initialize()
  end

  def get
  end

  def put
  end

end
class Accessor
 
  attr_reader :files

  def initialize(carrier=DummyCarrier.new)
    @carrier = carrier
  end

  def get filter
    @files = @carrier.read(filter)
  end

  def put files
    @carrier.write(files)
  end

end

if __FILE__ == $PROGRAM_NAME


# TODO: Make a generic class and and ReaderWriter (scp, ftp, http, networkdisk) to put/get files, 
# store in an array



# Fetch file list on current  (RDY, SSC, etc ...) timestamp on file or timestamp on filename?

# TODO: better filter for specific file ...

#nn = Dir.glob(['*.rb', '*.gz'])
nn = Dir.glob(['*.xml'])

files_from_system = FilesFromSystem.new



Dir.glob(['*.xml']) do | file |
  files_from_system << file
end

dtd_files_from_system = {}


# TODO: Select all DTDs and add them to a dict with message type as key!


dtd_paths = '/Users/fabv/ryjunk/DesignPatterns/Composite/dtds'

puts dtd_paths

#Dir.glob(['*.dtd']) do | file |
Dir.glob(["#{dtd_paths}/**/*.dtd"]) do | file |
  dtd_type = get_dtd_msg_type(file)
  dtd_files_from_system[dtd_type] = file
end

puts dtd_files_from_system

sorted = nn.sort do | a, b  |  File.birthtime(a) <=> File.birthtime(b) end

# latest file !!
xmlfile =  sorted.last

# Validate file

require 'libxml'

#dtd_name = xmlfile.gsub("xml", "dtd")
dtd_name = "#{dtd_files_from_system[files_from_system.files.first.msg]}"

puts dtd_name

path='./'

#raise "No DTD found for this XML-type #{xmlfile}" unless File.exist?("#{path}#{dtd_name}")

    include LibXML

#dtd = XML::Dtd.new(File.read("#{path}#{dtd_name}"))
dtd = XML::Dtd.new(File.read("#{dtd_name}"))
doc = XML::Document.file("#{path}#{xmlfile}")
doc.validate(dtd)

# Verify file

require 'nokogiri'

doc = File.open(xmlfile) { |f| Nokogiri::XML(f) }

msg =  doc.at_xpath 'vilordy/header/type'

puts msg.text
puts files_from_system.files.first.msg

# Parse filename and compare with content in file...


end
