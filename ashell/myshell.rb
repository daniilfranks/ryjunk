#!/usr/bin/env ruby

require 'readline'

#http://www.blackbytes.info/2016/07/writing-a-shell-in-ruby/

def old_system(command)
    exec(command)
end

 
while input = Readline.readline("> ", true)
  break                       if input == "exit"
  puts Readline::HISTORY.to_a if input == "hist"
 
  # Remove blank lines from history
  Readline::HISTORY.pop if input == ""
 
  system(input)
end