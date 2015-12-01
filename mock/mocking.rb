#http://radar.oreilly.com/2014/04/ruby-the-unit-test-friendly-language.html
require 'net/http'

class Spider
 
  attr_accessor :address, :path
 
  def get_response
    response = Net::HTTP.get_response(@address, @path)
  end
 
  def get_body
    get_response.body
  end
 
end

require 'test/unit'

class TestSpider < MiniTest::Unit::TestCase
 
  def test_get_body
 
    spider = Spider.new
    spider.address = 'programming.oreilly.com'
    spider.path = '/2014/02/why-ruby-blocks-exist.html'
    assert_includes spider.get_body,'Moved', "#{spider.get_body}"
 
  end
 
end

class FakeResponse
  attr_accessor :body
end


class TestSpiderMock < MiniTest::Unit::TestCase
 
  def test_get_
 
    spider = Spider.new
    spider.address = 'programming.oreilly.com'
    spider.path = '/2014/02/why-ruby-blocks-exist.html'

  def spider.get_
    response = FakeResponse.new
    response.body = 'Moved'
    response
  end
    assert_includes spider.get_body,'Moved', "#{spider.get_body}"
 
  end
 
end