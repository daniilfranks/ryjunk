module ConvertKey
  class InvalidKey < StandardError
  end

  def convert_2_id(key)
    raise InvalidKey.new, "Invalid key! #{key}" unless key.class == String &&
                                                       /\d+\:\d+\:\d+/ =~ key
    key.split(':').last.to_i
  end
end

if __FILE__ == $PROGRAM_NAME
  require 'test/unit'

  class TC_ConvertKey < Test::Unit::TestCase
    include ConvertKey
    def test_valid_key
      assert_not_nil convert_2_id('1:234:456')
    end

    def test_invalid_key
      assert_raises(ConvertKey::InvalidKey) { convert_2_id('1:2') }
    end

    def test_invalid_key_fixnum
      assert_raises(ConvertKey::InvalidKey) { convert_2_id(12) }
    end
  end
end
