# -*- coding: utf-8 -*-
require 'assit'

#assit_block(&block) ⇒ Object
assit_block{true}
#Executes the given block and asserts if the result is true.

#assit_equal(expected, actual, message = "Object expected to be equal") ⇒ Object
assit_equal 12, 12, "Not equal"
#Assert if two objects are equal.

#assit_fail "We failed!"
#assit_fail(message = "Assertion with assit_fail") ⇒ Object
#Fails the assertion.

#assit_kind_of(klass, object, message = "Object of wrong type") ⇒ Object
assit_kind_of String, "hejhipp","Nej Nje"
#Assert if something is of the right type.

#assit_not_nil(object, message = "Object is nil") ⇒ Object
assit_not_nil 1, "oj oj"
#Assert if an object is not nil.

class Q

  def nisse
  end
end

q = Q.new

#assit_quack(object, methods, message = "Quack assert failed.") ⇒ Object
assit_quack(q, :nisse, message ="men nen")
assit_quack([1], :pop, message ="men nen")
#Duck typing assertion: This checks if the given object responds to the given method calls.

#assit_real_string(object, message = "Not a non-empty string.") ⇒ Object
assit_real_string "Riktig strang", "Jaha?"
#Asserts that the given element is a string that is not nil and not an empty string, or a string only containing whitspaces.
