require 'timeout'

#
# TODO: Nice implementation that handle
# waits for events and timeouts if the
# do not arrive...
#
#

begin 
  Timeout::timeout(3) do
    sleep 13
  end
rescue Timeout::Error => e
  puts e.inspect
  puts 'hej!'
  puts e
  puts e.message
  puts e.backtrace
  puts e.backtrace.inspect

rescue Exception => e
  puts 'nej!'
end