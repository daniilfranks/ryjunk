#!/usr/bin/env ruby
begin
    File.open('afirst.rb', 'r') do |f1|  
      while line = f1.gets  
         puts line  
      end  
    end  
rescue Exception => e  
  puts "Hej"
  puts e.message  
  puts e.backtrace.inspect  
end  