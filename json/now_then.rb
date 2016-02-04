require 'json'
require 'fileutils'

# https://blog.engineyard.com/2015/seven-unusual-ruby-datastores



class Mementote

  def initialize(file = 'memetone.json')
    @file = file
    _write([]) unless File.exist?(@file)
  end

  public
  def write(id)
    temp = read
    _write(temp.push(id))
  end

  def read
    fh = File.open(@file, 'r')
    tmp = JSON.parse fh.read
    fh.close
    return tmp
  end

  def remove
    FileUtils.remove(@file) if File.exist?(@file)
  end

  private
  def _write(data)
    @fh = File.open(@file, 'w')
    @fh.write(data.to_json)
    @fh.close
  end

end


if __FILE__ == $PROGRAM_NAME

  require 'test/unit'

  class TC_MemetonetWrite < Test::Unit::TestCase
    def setup
      @meme = 'memetone'
      @memetone = Mementote.new(@meme)
    end

    def teardown
    end

    def test_a
      @memetone.write(2345)
      @memetone.write(5678)
    end

    def test_b
      assert_instance_of(Array, @memetone.read)
    end

    def test_c
      assert_equal(File.exist?(@meme), true)
    end

    def test_d

      @memetone.remove
      assert_equal(File.exist?(@meme), false)
    end




  end

  class TC_MemetonetRead < Test::Unit::TestCase
    def setup
      @meme = 'memetone'
      @memetone = Mementote.new(@meme)
    end

    def teardown
      @memetone.remove
    end

    def test_a

      @memetone.write(56788)
      @memetone.write(99889)

    end


    def test_b
      assert_instance_of(Array, @memetone.read)
    end

    def test_c

      @memetone.read.each do | item |

        assert_kind_of(Fixnum, item)
      end
    end

    def test_d
      assert_equal(File.exist?(@meme), true)
    end



  end

end




