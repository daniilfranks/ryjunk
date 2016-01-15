require 'yaml'
require 'fileutils'

# http://strugglingwithruby.blogspot.se/2008/10/yaml.html

class MyYAML

  def initialize(file='my.yml')
    @file = file
    #@store = (File.exists?(@file)? YAML::load_file(@file) : YAML::
    @store = YAML::load_file(@file)
  end

  def read
  end

  def write(id)
    @store['apikeys'] << id
    File.open(@file, 'w') {|f| f.write @store.to_yaml }
  end

  def remove
    FileUtils.rm(@file)      
  end

end

if __FILE__ == $PROGRAM_NAME

require 'test/unit'

  class TC_myYAML < Test::Unit::TestCase

    def setup
       @my_yaml = MyYAML.new
    end

    def test_arite
       @my_yaml.write('345')
       @my_yaml.write('678')
    end

    def test_read
       #result = @my_yaml.read()
       #assert_kind_of Array, result
       #assert_includes result, '345'
    end

    def test_remove
       #@my_yaml.remove()
       #assert_equal File.exist?('my.yaml'), false
    end

    def teardown
    end

  end



end