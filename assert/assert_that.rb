

# Nice if we could go for
# https://github.com/hamcrest/ramcrest
# or
# Write own assertions?

require 'rspec'
require 'ramcrest'

class Nisse; end

describe Nisse do
  include Ramcrest::Aint
  assert_that Nisse.new , aint(2)
end

extend Ramcrest::Anything

assert_that "a value", anything

extend Ramcrest::Comparable

assert_that 1, greater_than(0)
assert_that 2, less_than(3)
assert_that 3, greater_or_equal_to(3)
assert_that 4, less_or_equal_to(4)

extend Ramcrest::EqualTo

assert_that 10,  equal_to(10)

extend Ramcrest::HasAttribute
dance = Struct.new(:funk).new(2)
assert_that dance, has_attribute(:funk)
assert_that dance, has_attribute(:funk, equal_to(2))

extend Ramcrest::HasSize

assert_that [1,2], has_size(2)
#assert_that {:a => 2}, has_size(less_or_equal(3))

extend Ramcrest::Includes

assert_that [1,2,3], includes(2,3)
assert_that [6,7,2], includes(6, greater_than(6))


extend Ramcrest::IncludesExactly

assert_that [1,2,3], includes_exactly(1,2,3)
assert_that [3,2,1], aint(includes_exactly(1,2,3))
assert_that [1], aint(includes_exactly(1,2))

extend Ramcrest::Is

assert_that 1, is(1)
assert_that 2, is(greater_than(1))

extend Ramcrest::IncludesInAnyOrderExactly

assert_that [2,1 ,3], includes_in_any_order_exactly(1,2,3)
assert_that [1,3,4], aint(includes_in_any_order_exactly(1,3))

extend Ramcrest::SuchThat

#assert_that "my string", such_that do | value |
#	  value =~ /string/ ? :success : mismatch("didn't contain 'string'")
#    end


class AToken
  include Ramcrest::Matcher

  def initialize(name)
    @matchers = [Ramcrest::HasAttribute.has_attribute(:name, equal_to(name))]
  end

  def with_string(string)
    @matchers << Ramcrest::HasAttribute.has_attribute(:string, equal_to(string))
    self
  end

  def matches?(actual)
    @matchers.
      collect { |matcher| matcher.matches?(actual) }.
      find(method(:success)) { |result| !result.matched? }
  end

  def description
    "a token that #{@matchers.collect(&:description).join(' and ')}"
  end
end

def a_token_named(name)
  AToken.new(name)
end

assert_that "foo bar", is(a_token_named("foo").with_string("bar"))
assert_that "not foo baz", is(a_token_named("baz"))

