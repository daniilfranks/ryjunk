dtd = Nokogiri::XML::Document.parse(%{YOUR_DTD_SCHEMA})
document = Nokogiri::XML(File.open(“xmlDoc.xml”))
document.external_subset.validate