require 'minitest/autorun'
require './13_compare'

class VersionTest < Minitest::Test
  def setup
    @v1 = Version.new('2.1.1')
    @v2 = Version.new('2.3.0')
  end

  def test_major_number
    v = Version.new('2.1.3')
    assert_equal 2, v.major
    assert_equal 1, v.minor
    assert_equal 3, v.patch
  end

  def test_version_compare
    refute_equal @v1, @v2
    assert_operator @v1, :<, @v2
  end
end
