Given(/^we have behave installed$/) do
  expect(true).to eq(true)  # passes if actual == expected
  expect(true).to eql(true) # passes if actual.eql?(expected)
  expect(true).not_to eql(false) # passes if not(actual.eql?(expected))

Identity

expect(actual).to be(expected)    # passes if actual.equal?(expected)
expect(actual).to equal(expected) # passes if actual.equal?(expected)
Comparisons

expect(actual).to be >  expected
expect(actual).to be >= expected
expect(actual).to be <= expected
expect(actual).to be <  expected
expect(actual).to be_within(delta).of(expected)
Regular expressions

expect(actual).to match(/expression/)
Note: The new expect syntax no longer supports the =~ matcher.

Types/classes

expect(actual).to be_an_instance_of(expected) # passes if actual.class == expected
expect(actual).to be_a(expected)              # passes if actual.kind_of?(expected)
expect(actual).to be_an(expected)             # an alias for be_a
expect(actual).to be_a_kind_of(expected)      # another alias
Truthiness

expect(actual).to be_truthy   # passes if actual is truthy (not nil or false)
expect(actual).to be true     # passes if actual == true
expect(actual).to be_falsy    # passes if actual is falsy (nil or false)
expect(actual).to be false    # passes if actual == false
expect(actual).to be_nil      # passes if actual is nil
expect(actual).to_not be_nil  # passes if actual is not nil
Expecting errors

expect { ... }.to raise_error
expect { ... }.to raise_error(ErrorClass)
expect { ... }.to raise_error("message")
expect { ... }.to raise_error(ErrorClass, "message")
Expecting throws

expect { ... }.to throw_symbol
expect { ... }.to throw_symbol(:symbol)
expect { ... }.to throw_symbol(:symbol, 'value')
Yielding

expect { |b| 5.tap(&b) }.to yield_control # passes regardless of yielded args

expect { |b| yield_if_true(true, &b) }.to yield_with_no_args # passes only if no args are yielded

expect { |b| 5.tap(&b) }.to yield_with_args(5)
expect { |b| 5.tap(&b) }.to yield_with_args(Fixnum)
expect { |b| "a string".tap(&b) }.to yield_with_args(/str/)

expect { |b| [1, 2, 3].each(&b) }.to yield_successive_args(1, 2, 3)
expect { |b| { :a => 1, :b => 2 }.each(&b) }.to yield_successive_args([:a, 1], [:b, 2])
Predicate matchers

expect(actual).to be_xxx         # passes if actual.xxx?
expect(actual).to have_xxx(:arg) # passes if actual.has_xxx?(:arg)
Ranges (Ruby >= 1.9 only)

expect(1..10).to cover(3)
Collection membership

expect(actual).to include(expected)
expect(actual).to start_with(expected)
expect(actual).to end_with(expected)

expect(actual).to contain_exactly(individual, items)
# ...which is the same as:
expect(actual).to match_array(expected_array)
Examples

expect([1, 2, 3]).to include(1)
expect([1, 2, 3]).to include(1, 2)
expect([1, 2, 3]).to start_with(1)
expect([1, 2, 3]).to start_with(1, 2)
expect([1, 2, 3]).to end_with(3)
expect([1, 2, 3]).to end_with(2, 3)
expect({:a => 'b'}).to include(:a => 'b')
expect("this string").to include("is str")
expect("this string").to start_with("this")
expect("this string").to end_with("ring")
expect([1, 2, 3]).to contain_exactly(2, 3, 1)
expect([1, 2, 3]).to match_array([3, 2, 1])

end

When(/^we implement a test$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^behave will test it for us!$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
