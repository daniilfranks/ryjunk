require 'nokogiri'

DTD_PATH = "./mmm.dtd"
XML_PATH = "./mmm.xml"

xml = File.read(XML_PATH)
options = Nokogiri::XML::ParseOptions::DTDVALID
doc = Nokogiri::XML::Document.parse(xml, nil, nil, options)
#puts doc.external_subset.validate(doc)
puts doc.validate.class # public_methods
#puts doc.validate(doc)
