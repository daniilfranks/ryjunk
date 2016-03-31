require 'test/unit/assertions'
include Test::Unit::Assertions
require 'date'
# http://danwin.com/2013/03/ruby-minitest-cheat-sheet/


def assert_updated_match old, now

  assert_operator DateTime.parse(old), :<, DateTime.parse(now), "#{old} not older than #{now}"

end



old = '2017-01-12'
now = '2016-01-12'

assert_updated_match old, now











