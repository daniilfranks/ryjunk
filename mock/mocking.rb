#!/usr/bin/env ruby


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

class TestSpider < Test::Unit::TestCase
 
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


class TestSpiderMock < Test::Unit::TestCase
 
  def test_get_body
 
    spider = Spider.new
    spider.address = 'programming.oreilly.com'
    spider.path = '/2014/02/why-ruby-blocks-exist.html'

    def spider.get_response
      response = FakeResponse.new
      response.body = 'Moved'
      response
    end

    assert_includes spider.get_body,'Moved', "#{spider.get_body}"
  end
 
end
