# http://strugglingwithruby.blogspot.se/2008/10/yaml.html
class Config
  attr_reader :dummyr, :indir, :outdir, :freq_file_fuzz, 
              :freq_fuzz_within_file,
              
              :dummyt, :site, :user, :passwd,	
  
              :random, :freq_file
  # TODO: add configfile but still use ||= concept?             
  def initialize()
  	 config = YAML.load_file("config.yml")

  	 # Loglevel
  	 @loglevel = config['loglevel']
     
     # Reader
     @dummyr = config['dummyr']
     @indir = config['indir']
     @outdir = config['outdir']
     @freq_file_fuzz = config['freq_file_fuzz']
     @freq_fuzz_within_file = config['freq_fuzz_within_file']

     # Transmitter
     @dummyt = config['dummyt']
     @site = config['site']
     @user = config['user']
     @passwd = config['passwd']

     # Runner
     @random = config['random']
     @freq_file = config['freq_file']

  end
end
