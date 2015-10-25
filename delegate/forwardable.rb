
require 'forwardable'

class RecordCollection
  attr_accessor :records
  extend Forwardable
  def_delegator :@records, :[], :record_number
  def_delegators :@records, :size, :<< , :map
end






r = RecordCollection.new
r.records = [4,5,6]
puts r.record_number(0) 

r = RecordCollection.new
r.records = [1,2,3]
puts r.record_number(0)   # => 1
puts r.size               # => 3
r << 4               # => [1, 2, 3, 4]
puts r.map { |x| x * 2 }  # => [2, 4, 6, 8]

