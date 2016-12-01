require 'net/ftp'
require 'fileutils'
#anonymous

class FetchTask

  include Enumerable

  def each
  end

  def <=>(other)
  end

  def self.doit(args={})

    @@args = defaults.merge(args)

    FileUtils.mkdir(@@args[:path]) unless File.exist?(@@args[:path])

    Net::FTP.open(@@args[:server]) do |ftp|
      ftp.login(user = @@args[:user], passwd = @@args[:pwd])
      ftp.chdir(@@args[:rpath])
      files = ftp.list() #{ args[:suffix] }
      filtered = files.select { | file | file.include?('pdf') }  
#      fetch_files = files.collect { | file | "#{file.split(' ').last}" }  
      puts filtered
#      filtered.each { | file | ftp.getbinaryfile(remotefile=file , localfile = "#{@@args[:path]}/#{file}") }

    end

  end

  def self.defaults
    {
      server: 'ftp.sunet.se', user: 'anonymous', pwd: '',
#      rpath: 'mirror/archive/ftp.sunet.se/pub/Linux/distributions/bifrost/download/logo/',
      rpath: '/mirror/archive/ftp.sunet.se/pub/Linux/distributions/bifrost/doc/',
#      suffix: ['*.png', '*.xml', '*.zip'],
      suffix: ['*.pdf'],
      path:  'tmp'
    }
  end

  def self.remove_dir
    #rpath = defaults[:path]
    FileUtils.remove_dir(defaults[:path])
  end

end


if __FILE__ == $PROGRAM_NAME

  FetchTask.doit()

#  FetchTask.remove_dir

end