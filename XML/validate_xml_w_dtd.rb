#!/usr/bin/env ruby
# encoding: utf-8

# ./validate-xml-dtd "file.xml" "file.dtd"

require 'rubygems'
require 'libxml'
include LibXML

dtd = XML::Dtd.new(File.read(ARGV.pop))
doc = XML::Document.file(ARGV.pop)
doc.validate(dtd)