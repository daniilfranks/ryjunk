#!/usr/bin/env ruby
require 'contracts'
require 'rubycheck'


# Define gen_even
module RubyCheck
  def self.gen_even
    i = gen_int
    if i.even?
      i
    else
      i + 1
    end
  end
end
prop_even = -> n { n.even? }
# Should fail.
RubyCheck.for_all(prop_even, [:gen_int])
# Should pass.
RubyCheck.for_all(prop_even, [:gen_even])
# Define gen_palindrome
module RubyCheck
  def self.gen_palindrome
    s = gen_str
    s + s.reverse
  end
end
prop_palindrome = -> s { s == s.reverse }
# Should fail.
RubyCheck.for_all(prop_palindrome, [:gen_str])
# Should pass.
RubyCheck.for_all(prop_palindrome, [:gen_palindrome])
