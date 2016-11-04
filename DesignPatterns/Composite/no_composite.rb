
# TODO: Make a generic class and and ReaderWriter (scp, ftp, http, networkdisk) to put/get files,
# store in an array

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


###############################################################################

def get_dtd_msg_type(name)
 filename = File.basename(name)
 olle = filename.match(/(?<game>[\w]{4})(?<msg>[\w]{3})(?<rrr>[\w\d\.]+)/)
 return olle[:msg]
end


require 'date'
require 'nokogiri'

class FileFromSystem

  include Comparable
  attr_reader :date_content, :msg, :filename

  def initialize filename
    @filename = filename
    parse_filename
  end

  def parse_filename
    nisse = @filename.match(/(?<datum>[\d]{7})(?<game>[\w]{4})(?<msg>[\w]{3})(?<src>[\w]{3})(?<dst>[\w]{3})(?<rrr>[\w\d\.]+)/)
    @date_content = Date.strptime(nisse[:datum], '%G%V%u')
    @msg = nisse[:msg]
  end

  def <=> other
     self.date_content <=> other.date_content
  end


  # TODO: Uniq method for every type of msg?

  def verify_content

    # TODO: Use search instead of xpath, not use absolute path...

    doc = File.open(@filename) { |f| Nokogiri::XML(f) }
    msg =  doc.at_xpath "vilo#{@msg.downcase}/header/type"

    dtx = doc.at_xpath "vilo#{@msg.downcase}/header/created"
    dt = Date.parse(dtx.text)

    return (msg.text == @msg and @date_content == dt)
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

  def old_each
    @files.each { | f | f }
  end

  def each(&block)
    @files.each(&block)
  end

end


# latest file !!
#nn = Dir.glob(['*.xml', '*.gz'])
#sorted = nn.sort do | a, b  |  File.birthtime(a) <=> File.birthtime(b) end
#xmlfile =  sorted.first

def validate_xml dtd_files_from_system, files_from_system

  require 'libxml'
  include LibXML

  sorti = files_from_system.sort
  xmlfile = sorti.first

  # Find DTD for given XML!
  raise "No DTD found for this XML-type #{xmlfile.filename}" unless dtd_files_from_system.has_key?(xmlfile.msg)
  dtd_name = "#{dtd_files_from_system[xmlfile.msg]}"


  path ='./'
  dtd = XML::Dtd.new(File.read("#{dtd_name}"))
  doc = XML::Document.file(xmlfile.filename)
  doc.validate(dtd)

  puts "validate OK!"

end


if __FILE__ == $PROGRAM_NAME

# TODO: Filter for RDY or SNW or other message files ....
puts "---Find XML files ..."
files_from_system = FilesFromSystem.new
xml_path = '.'
Dir.glob(["#{xml_path}/**/*.xml"]) { | file | files_from_system << file }

puts "---Find DTDs..."
dtd_files_from_system = {}
dtd_paths = './dtds'
Dir.glob(["#{dtd_paths}/**/*.dtd"]) { | file |  dtd_files_from_system[get_dtd_msg_type(file)] = file  }

puts "---Validate file"
validate_xml dtd_files_from_system, files_from_system

puts "---Verify file"

raise "Verification failed ..."  unless files_from_system.files.first.verify_content


end
