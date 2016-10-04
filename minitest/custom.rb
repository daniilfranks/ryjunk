
# http://www.rubypigeon.com/posts/minitest-cheat-sheet/?utm_source=The+Pigeonhole&utm_campaign=6c123f9a27-New_Post_Minitest_Cheat_Sheet9_28_2016&utm_medium=email&utm_term=0_cf36a98e08-6c123f9a27-97166557

require 'minitest/autorun'
class CustomAssertionTest < Minitest::Test
  def assert_uppercase(str, msg = nil)
    msg = message(msg) { "Expected #{mu_pp(str)} to be uppercase" }
    assert(str == str.upcase, msg)
  end

  def test_custom_assertion
    assert_uppercase 'HAHAHA'
  end
end
