require 'minitest/autorun'
require 'minitest/pride'
require './lib/torpedo'

class TorpedoTest < MiniTest::Test

  def test_torpedo_exists
    torpedo = Torpedo.new("A1")

    assert_instance_of Torpedo, torpedo
  end

  def test_torpedo_knows_its_position
    torpedo = Torpedo.new("A3")

    assert_equal "A3", torpedo.position
  end
end
