
# --cannot perform <action> at <location>:<something> is <actual> but 
	# must be <expected>--

class DataEror <StandardError
  def initialize(logger, msg)
   logger.error msg
  end
end

class DataError< StandardError
  def initialize(logger, action, location, subject, actual, expected)
    logger.error "Cannot perform #{action} at #{location} : #{subject} is #{actual} but must be #{expected}"
  end
end

# TODO: catch json : UnparserError, ArgumentError
#             zlib : Zlib::Error
#             ostruct : 

if __FILE__ == $PROGRAM_NAME

require 'logger'
require 'test/unit'


  class TC_ExceptionStuff<Test::Unit::TestCase

    def setup
      @logger = Logger.new(STDOUT)
    end

    def teardown
    end

    def test_zero
      assert_raise(DataEror) {raise DataEror.new(@logger, msg = 'hej' )}
    end

    def test_first
      assert_raise(DataError) { raise DataError.new(@logger, action ='unparse', location='c:', 
                                subject='jsonfile', actual ='??', expected='janne.json') }
    end

  end

end