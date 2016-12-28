f = IO.popen("uname")
p f.readlines
f.close
puts "Parent is #{Process.pid}"
IO.popen("date") { |f| puts f.gets }
IO.popen("-") {|f| $stderr.puts "#{Process.pid} is here, f is #{f.inspect}"}
p $?
IO.popen(%w"sed -e s|^|<foo>| -e s&$&;zot;&", "r+") {|f|
  f.puts "bar"; f.close_write; puts f.gets
}