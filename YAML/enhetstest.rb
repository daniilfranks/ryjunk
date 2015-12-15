require 'yaml/store'
require 'fileutils'


class MyYAML

  def initialize(file='my.yml')
    @file = file
    @store = YAML::Store.new(file)
    @my_array = Array.new
  end

  def write(id)
    @my_array << id
    @store.transaction do
      @store[:apikeys] = @my_array
    end
  end

  def read
    ret = Array.new
    @store.transaction(true) do
      @store.roots.each do | data_root_name |
        ret = @store[data_root_name]
      end
    end
    
    return ret
  
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
     result = @my_yaml.read()
     assert_kind_of Array, result
     assert_includes result, '345'
  end

  def test_remove
     @my_yaml.remove() 
     assert_equal File.exist?('my.yaml'), false
  end

  def teardown
  end

end



end