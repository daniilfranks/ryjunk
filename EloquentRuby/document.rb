require 'awesome_print'
require_relative './writing_quality'
class Document
  include Enumerable
  include WritingQuality

  attr_accessor :title, :author, :content

  def initialize(title, author, content = "This is the ethereal and you noticed...")
    @title = title
    @author = author
    @content = content
    @words = content.split(' ')

    yield(self) if block_given?

  end

  def +(other)
    Document.new(title, author, "#{content} #{other.content}")
  end


  def !
    Document.new(title, author, "It is not true: #{content}")
  end

  def [](index)
    @words[index]
  end

  def []=(index, value)
    @words[index] = value
    @content = @words.join(' ')
  end

  def each
    @words.each { |word| yield(word) }
  end

  def each_word_pair
    @words.each_cons(2) { |array| yield array[0], array[1] }
  end

  def on_save( &block)
    @save_listener = block
  end

  def on_load( &block)
    @load_listener = block
  end

  def load( path )
    @content = File.read( path )
    @load_listener.call( self, path) if @load_listener
  end

  def save( path )
    File.open( path, 'w') { | f |  f.print( @contents ) }
    @save_listener.call( self, path) if @save_listener
  end

end


if __FILE__ == $PROGRAM_NAME


  # plus operator
  doc1 = Document.new('Tag Line1' , 'Kirk', "These are the voyages")
  doc2 = Document.new('Tag Line2' , 'Kirk', "of the star ship ...")

  total_doc = doc1 + doc2
  puts total_doc.content

  # !
  favorite = Document.new('Favorite' , 'Russ', "Chocolate is best")

  

  nisse = !favorite

  puts nisse.content

  puts nisse[0]

  nisse[0] = 'Was'

  puts nisse.content

  testing_cliche = Document.new('Favorite' , 'Russ', "make no mistakes")
  puts testing_cliche.number_of_cliches

#  testing_cliche.each { | w  | puts w }

  testing_cliche.each_word_pair { | w  | puts w }


  new_doc = Document.new('Favorite' , 'Russ', '') do | d |
    d.content << 'We the people'
    d.content << ' In order to form a more perfect union...'
  end

  puts new_doc.content



  ng_doc = Document.new('Favorite' , 'Russ', '')

  ng_doc.on_load do | doc |
    puts "Hey, I've been loaded!"
  end


  ng_doc.on_save do | doc |
    puts "Hey, I've been saved!"
  end
  

  ng_doc.load('big.txt')
  ng_doc.save('big.txt')

end