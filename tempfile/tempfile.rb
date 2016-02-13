require 'tempfile'

file = Tempfile.new('foo')
file.path      # => A unique filename in the OS's temp directory,
               #    e.g.: "/tmp/foo.24722.0"
               #    This filename contains 'foo' in its basename.


puts file.path
FileUtils.touch file.path
file.write("hello world")
file.rewind
puts file.read      # => "hello world"
file.close
file.unlink    # deletes the temp file
