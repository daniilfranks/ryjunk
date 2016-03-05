#require 'rest-client'
require 'stringio'
#require 'solid_assert'

#SolidAssert.enable_assertions 

class LogFile

  LOG_DIR = 'irc_logs'

  def initialize(name)
    @name = "#{LOG_DIR}/#{name}"
    puts "fetch: #{LOG_DIR}/#{name}"
  end

  def exist?
    File.exist?(@name) 
  end

  def log_contents
    puts 'reading lines ...'
    File.readlines(@name).join
  end

  def save_page(page)
    File.open(@name, "w+") do | f  | f.puts page end
  end

  def handle(fh)
  end
end

class URLFetcher
  def initialize(url)
    @url = url
  end

  def download_page
    response = RestClient.get(@url).body    
    assert response != nil
    #puts response
    return response
  end
end

# TODO: Class have two external i/f. Try to isolate them so it's possible to
#       to mock them out.
class LogParser

  def initialize(date, fetcher, logfile)
    @date = date
    @fetcher = fetcher
    @logfile = logfile
  end

  def get_messages
    return @logfile.log_contents if @logfile.exist?
    page = @fetcher.download_page
    @logfile.save_page(page)
    page
  end

end

if __FILE__ == $PROGRAM_NAME

  require 'test/unit'

  class TC_LogFile <Test::Unit::TestCase
    def setup
      @file = LogFile.new('poppy')
    end

    def test_handle
      fh = StringIO.new('hej hopp')
      @file.handle(fh)
    end

    def test_name
      
    end


  end


  # TODO :1) Try to mock class!
  #      :2) Try to mock a method!
  class TC_LogParser<Test::Unit::TestCase

    def setup
      date = '2015-01-14'
      fetcher = URLFetcher.new("http://irclog.whitequark.org/ruby/#{@date}.txt")
      logfile = LogFile.new("irc-log-#{date}.txt")
      @logparser = LogParser.new(date, fetcher, logfile)
    end

    def teardown
    end
 
    def test_get_message
      assert_not_equal  @logparser.get_messages.length,  0
    end


  end


end
