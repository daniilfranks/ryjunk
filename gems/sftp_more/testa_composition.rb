require 'net/ftp'
require 'net/sftp'
require 'fileutils'

class FtpAccess

  def defaults
    {
      server: 'ftp.sunet.se', 
      user: 'anonymous',
      pwd: '',
      rpath: '/mirror/archive/ftp.sunet.se/pub/Linux/distributions/bifrost/doc/',
      suffix: ['*.png', '*.xml', '*.zip'],
      path:  'tmp'
    }
  end

  def initialize (args={})
    ObjectSpace.define_finalizer(self, self.method(:finalize))
  
    args = defaults.merge(args)
    @ftp =  Net::FTP.open(args[:server])
    @ftp.login(user = args[:user], passwd = args[:pwd])
    @ftp.chdir(args[:rpath])
  end

  def list
    @ftp.list
  end

  def fetch
  end

  def put
  end


  def finalize(object_id)
    @ftp.close
  end


end

class SFtpAccess

  def defaults
    {
      server: 'ftp.sunet.se', 
      user: 'anonymous',
      pwd: '',
      rpath: '/mirror/archive/ftp.sunet.se/pub/Linux/distributions/bifrost/doc/',
      suffix: ['*.png', '*.xml', '*.zip'],
      path:  'tmp'
    }
  end

  def initialize (args={})
    ObjectSpace.define_finalizer(self, self.method(:finalize))

    args = defaults.merge(args)
    @sftp = Net::SFTP.start(args[:server], args[:user], :password => args[:pwd])
    @path = args[:rpath]
  end

  def list
    @sftp.dir.foreach(@path) do |entry|
      puts entry.longname
    end
  end

  def fetch
  end

  def put
  end

  def finalize(object_id)
    @sftp.close
  end

end


class Accessor

  def initialize(accessor=FtpAccess.new)
    @accessor = accessor
  end

  def list
    @accessor.list
  end

end

if __FILE__ ==$PROGRAM_NAME

require 'minitest/autorun'

class FtpTests < Minitest::Test

  # The `setup` method is run before every test.
  def setup
    @accessor = Accessor.new
  end

  # The `teardown` method is run after every test.
  def teardown
  end

  # Tests are methods that begin with "test_".
  def test_list_files
    Kernel.puts @accessor.list
    assert_nil @accessor.list
  end

end

=begin

class SFtpTests < Minitest::Test

  # The `setup` method is run before every test.
  def setup
    @accessor = Accessor.new(accessor=SFtpAccess.new)
  end

  # The `teardown` method is run after every test.
  def teardown
  end

  # Tests are methods that begin with "test_".
  def test_list_files
    Kernel.puts @accessor.list
    assert_nil @accessor.list
  end

end
=end

end