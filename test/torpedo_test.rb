require 'minitest/autorun'
require 'minitest/pride'
require './lib/torpedo'

class TorpedoTest < MiniTest::Test

  def test_torpedo_exists
    torpedo = Torpedo.new("player 1", "A1", false)

    assert_instance_of Torpedo, torpedo
  end

  def test_torpedo_knows_its_position
    torpedo = Torpedo.new("player 1", "A3", false)

    assert_equal "A3", torpedo.position
  end

  def test_torpedo_knows_who_shot_it
    torpedo = Torpedo.new("player 2", "B4", false)

    assert_equal "player 2", torpedo.player
  end


end
