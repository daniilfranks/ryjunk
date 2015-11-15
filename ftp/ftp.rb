require 'net/ftp'

Net::FTP.open('privat.bahnhof.se') do |ftp|
  ftp.login('wb177225', 'yyyyy')
  files = ftp.list('*')
  puts files
end