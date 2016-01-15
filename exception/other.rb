begin
  puts "Press ctrl-C when you get bored"
  loop {}
rescue Interrupt => e
  puts "Note: You will typically use Signal.trap instead."
end