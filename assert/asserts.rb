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
#assert_output("hi\n"){puts "hi"}
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
#assert_silent{1+1}
# throws
assert_throws(:up){throw :up}


class MyTest<Test::Unit::TestCase
  def setup
  end

  def test_my
  end

end

if __FILE__ == $PROGRAM_NAME

my_test = MyTest.new 1




end









