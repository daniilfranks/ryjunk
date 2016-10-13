require 'minitest/autorun'

# Classes act as groups of tests.
class RandomTests < Minitest::Test

  # The `setup` method is run before every test.
  def setup
    @random = File.open('/dev/random')
  end

  # The `teardown` method is run after every test.
  def teardown
    @random.close
  end

  # Tests are methods that begin with "test_".
  def test_reading
    content = @random.read(5)
    assert_equal 5, content.length
  end

  # The `skip` method prevents a test from running.
  # Skipped tests do not count as failures.
  def test_skipping
    skip 'Fix this test later'
  end

end