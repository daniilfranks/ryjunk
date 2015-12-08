#!/usr/bin/env ruby


#http://radar.oreilly.com/2014/04/ruby-the-unit-test-friendly-language.html

require 'net/http'
require 'pp'



class Spider
 
  attr_accessor :address, :path

  private 
  def get_response
    response = Net::HTTP.get_response(@address, @path)
  end
 
  public
  def get_body
    get_response.body
  end

  def get_code
    return get_response.code
  end 
end

require 'test/unit'

class TestSpider < Test::Unit::TestCase
 
  def test_get_body
    spider = Spider.new
    spider.address = 'programming.oreilly.com'
    spider.path = '/2014/02/why-ruby-blocks-exist.html'
    assert_includes spider.get_body,'Moved', "#{spider.get_body}"
    assert_equal "301", spider.get_code  # moved permantly
  end
 
end

class TestSpider < Test::Unit::TestCase
 
  def test_get_body
    spider = Spider.new
    spider.address = 'example.com'
    spider.path = '.'
    assert_equal "400", spider.get_code
  end
 
end

class FakeResponse
  attr_accessor :body, :code
end


class TestSpiderMock < Test::Unit::TestCase
 
  def test_get_body
 
    spider = Spider.new
    spider.address = 'programming.oreilly.com'
    spider.path = '/2014/02/why-ruby-blocks-exist.html'

  def spider.get_response
    response = FakeResponse.new
    response.body = 'Moved'
    response.code = "401"
    response
  end
    assert_includes spider.get_body,'Moved', "#{spider.get_body}"
    #puts spider.get_code
    assert_equal  "401", spider.get_code, msg=spider.get_code

  end
 
end
