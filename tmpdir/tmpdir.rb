require 'tempfile'
require 'fileutils'
#nn = Dir.tmpdir
#nn =Dir.mktmpdir(nil, "/var/tmp") {|dir| dir is "/var/tmp/d..." }
#puts nn

=begin
Dir.mktmpdir do |dir|
  puts "My new temp dir: #{dir}"
end
=end

nn =Dir.mktmpdir() 

puts nn

FileUtils.remove_dir(nn)

FileUtils.remove_dir(nn)

