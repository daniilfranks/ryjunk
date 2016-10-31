require 'net/ftp'

#anonymous

class FetchTask

  def self.old_doit(server='ftp.sunet.se', user='anonymous', pwd = nil)


    Net::FTP.open(server) do |ftp|
      ftp.login(user = user, passwd = pwd)
      ftp.chdir('mirror/archive/ftp.sunet.se/pub/Linux/distributions/bifrost/download/logo/')
      files = ftp.list('*.png')
      
      fetch_files = files.collect { | file | "#{file.split(' ').last}" }
  
      fetch_files.each { | file |  ftp.getbinaryfile(file) }

    end

  end

  def self.doit(args={})

    args = defaults.merge(args)

    puts args

    Net::FTP.open(args[:server]) do |ftp|
      ftp.login(user = args[:user], passwd = args[:pwd])
      ftp.chdir(args[:rpath])
      files = ftp.list(args[:suffix])
      puts files
      fetch_files = files.collect { | file | "#{file.split(' ').last}" }
  
      puts '*' * 80
      puts fetch_files 
      puts '*' * 80

      fetch_files.each { | file |  ftp.getbinaryfile(file) }

    end

  end

  def self.defaults
    {
      server: 'ftp.sunet.se', user: 'anonymous', pwd: nil,
      rpath: 'mirror/archive/ftp.sunet.se/pub/Linux/distributions/bifrost/download/logo/',
      suffix: '*.png',
      path:  '.'   #TODO how to put files to a tempdir? is it nesc?
    }
  end

end


if __FILE__ == $PROGRAM_NAME

  FetchTask.doit()

end