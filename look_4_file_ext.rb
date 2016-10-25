require 'open3'

all = Hash.new(0)

Dir.glob('./**/*').each do | file |

  next if File.directory?(file)

  all[File.extname(file)]+=1

  #puts file if File.extname(file) == ""

  # List unwanted files author !!
  
  stdout, stdeerr, status = Open3.capture3('git log --pretty=format:"%an" #{file}')
  puts "#{stdout}: #{file}" if File.extname(file) == ".rb~"
end


all.each { | k, v| puts "#{k}: #{v}"  }