
class Paragraph
  
  attr_accessor :font_name, :font_size, :font_emphasis
  attr_accessor :text

  def initialize name, size, emphasis, text
    @font_name = font_name
    @font_size = font_size
    @font_emphasis = font_emphasis
    @text = text
  end	
 
  def to_s
  	@text
  end

end


class StructuredDocument

  attr_accessor :paragraphs

  def initialize(author, title)
        @author = author
        @title = title
  	@paragraphs = []
  end

  def self.paragraph_type( paragraph_name, options)

   options = defaults.merge(options)
   name = options[:font_name]
   size = options[:font_size]
   emphasis = options[:font_emphasis]

   define_method(paragraph_name) do | text |
   	paragraph = Paragraph.new( name, size, emphasis, text)
   	self << paragraph 
   end	

  end

  def <<(paragraph)
    @paragraphs << paragraph
  end

  def self.defaults
    { font_name: :arial, font_size: 12, font_emphasis: :none } 
  end

end


class Resume < StructuredDocument
	paragraph_type(:name,
                   :font_name => :arial,
                   :font_size => 18,
                   :font_emphasis => :italic
		)

end


if __FILE__ == $PROGRAM_NAME

fabv = Resume.new("fredde", "resume") do | cv |
	  cv.name("Fredrik Svärd")
	  cv.address("Baloba 1345 Minderby")
	  cv.email("nfredrik@hotmail.com")

end

fabv << 'Nisse är hemma igen gud ske lov!'
fabv << 'Jag är också väldigt glad'

puts fabv.inspect
  
end