require "test/unit/assertions"
include Test::Unit::Assertions	


assert_equal 1, 1, "This is wrong"

olle = {:a => 1, :b => 2} 
pelle = {:a => 1, :b => 3}

assert_equal olle, pelle 
