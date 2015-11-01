require 'test/unit'
extend Test::Unit::Assertions

# http://danwin.com/2013/03/ruby-minitest-cheat-sheet/

# Empty

assert_empty []
refute_empty [1,2,3]

# Equal

assert_equal true, true
assert_equal 5 ,5

# Delta

assert_in_delta 2012, 2010, 2

refute_in_delta 2012, 3013, 3

# Epsilon

assert_in_epsilon 1.0, 1.02, 0.05

refute_in_epsilon 1.0, 1.06, 0.05

# Includes

assert_includes [1,2], 2

refute_includes [1,2], 3

# Instance of

assert_instance_of String, "bar"
refute_instance_of String, 100

# Kind of
assert_kind_of Numeric, 100
refute_kind_of Numeric, "bar"

# Match
assert_match /\d/, "42"
assert_match /\d{3}/, 423.to_s
refute_match /\d/, "foo"

# Nil

assert_nil [].first
refute_nil [1].first

# Operator

assert_operator 1, :<, 2
refute_operator 1, :>, 2

# Output
assert_output("hi\n"){puts "hi"}
#Proc{puts "hi"}.must_output "hi\n"

# raises
assert_raises(NoMethodError){nil!}

# respond_to

assert_respond_to "foo", :empty?
refute_respond_to 100, :empty?

# same
assert_same :foo, :foo
refute_same ['foo'], ['foo']

# silent
assert_silent{1+1}
# throws
assert_throws(:up){throw :up}




# Nice if we could go for
# https://github.com/hamcrest/ramcrest
# or
# Write own assertions?

require 'ramcrest'

extend Ramcrest::Aint

assert_that 1, aint(2)

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









