

class DTDPicker

  attr_reader :dtds
  def initialize(dtd_dir)
    @dtds = {}
  end


end

class FileNameParser

  attr_reader :msg

  def initialize
  end

end


class XMLfile

  def initialize(name_parser, dtdpicker)
    choosen_dtd = dtdpicker[name_parser.msg]
  end


  def validate
    dtd = Nokogiri::XML::Document.parse(%{YOUR_DTD_SCHEMA})
    document = Nokogiri::XML(File.open(“xmlDoc.xml”))
    document.external_subset.validate
    true
  end

  def verify
    true
  end

end

if __FILE__ == $PROGRAM_NAME

  dtd_picker = DTDPicker.new
  filename_parser = FileNameParser.new(filename)

  xml_file = XMLFile.new(filename_parser, dtd_picker)

  xml_file.validate

  xml_file.verify

end







