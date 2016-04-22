
require_relative 'platfrom'
include OS

puts OS::get_platform
puts get_platform

#puts Platform::get_cwd


puts 'hej' unless (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil