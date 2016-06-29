require 'debug_inspector'

# Open debug context
# Passed `dc' is only active in a block
RubyVM::DebugInspector.open { |dc|
  # backtrace locations (returns an array of Thread::Backtrace::Location objects)
  locs = dc.backtrace_locations

  # you can get depth of stack frame with `locs.size'
  locs.size.times do |i|
    # binding of i-th caller frame (returns a Binding object or nil)
    p dc.frame_binding(i)

    # iseq of i-th caller frame (returns a RubyVM::InstructionSequence object or nil)
    p dc.frame_iseq(i)

    # class of i-th caller frame
    p dc.frame_class(i)
  end
}
