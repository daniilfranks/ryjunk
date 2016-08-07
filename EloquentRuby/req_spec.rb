require './document'

# look at www.rspec.info

describe Document do

  it 'should hold on to the contents' do
    text = "A bunch of words"
    doc = Document.new('test', 'nobody', text)
    doc.content.should == text
  end
end