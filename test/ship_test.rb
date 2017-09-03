require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < MiniTest::Test

  def test_ship_exists
    ship = Ship.new("coordinate_range")

    assert_instance_of Ship, ship
  end
end
