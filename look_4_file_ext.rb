

all = Hash.new(0)

Dir.glob('./**/*').each do | file |

  next if File.directory?(file)

  all[File.extname(file)]+=1

  puts file if File.extname(file) == ""

end


all.each { | k, v| puts "#{k}: #{v}"  }