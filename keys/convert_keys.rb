module ExtractAttr
  class InvalidKey < StandardError
  end

  def get_id(key)
    raise InvalidKey.new, "Invalid key! #{key}" unless key.class == String &&
                                                       /\d+\:\d+\:\d+/ =~ key
    key.split(':').last.to_i
  end

  def get_home_name(key)
    raise InvalidKey.new, "Invalid key! #{key}" unless key.class == String &&
                                                        /\w+\-\w+/ =~ key
    key.split('-').first

  end

  def get_away_name(key)
    raise InvalidKey.new, "Invalid key! #{key}" unless key.class == String &&
                                                        /\w+\-\w+/ =~ key
    key.split('-').last
  end
  
end

if __FILE__ == $PROGRAM_NAME
  require 'test/unit'

  class TC_ExtractAttr < Test::Unit::TestCase
    include ExtractAttr
    def test_valid_key
      assert_not_nil get_id('1:234:456')
    end

    def test_invalid_key
      assert_raises(ExtractAttr::InvalidKey) { get_id('1:2') }
    end

    def test_invalid_key_fixnum
      assert_raises(ExtractAttr::InvalidKey) { get_id(12) }
    end

    def test_valid_teams
      assert_equal 'Janne', get_home_name('Janne-Kalle')
      assert_equal 'Kalle', get_away_name('Janne-Kalle')
    end

    def test_valid_teams2
      assert_equal 'Janne_11', get_home_name('Janne_11-11_Kalle')
      assert_equal '11_Kalle', get_away_name('Janne-11_Kalle')
    end

    def test_invalid_key_get_home
      assert_raises(ExtractAttr::InvalidKey) { get_home_name('Janne_11+11_Kalle') }
    end
    
  end
end
