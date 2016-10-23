
min_hash = Hash.new(0)

Dir.glob("./**/*.feature").each do | file |
  File.open(file).readlines.each do | d |
    d.scan(/@\w+/).each { | x | min_hash[x]+=1 }
  end
end

min_hash.each { | k, v |  puts "#{k}:#{v}" }
