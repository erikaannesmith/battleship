require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < MiniTest::Test

  def test_ship_exists
    ship = Ship.new("coordinate_range")

    assert_instance_of Ship, ship
  end

  def test_occupies_coordinate_when_coordinate_occupied_horizontally
    ship = Ship.new("A1 A3")

    assert ship.occupies?("A1")
    assert ship.occupies?("A2")
    assert ship.occupies?("A3")
  end

  def test_occupies_coordinate_when_coordinate_not_occupied_horizontally
    ship = Ship.new("A1 A3")

    refute ship.occupies?("A4")
    refute ship.occupies?("B2")
  end

  def test_occupies_coordinate_when_coordinate_occupied_vertically
    ship = Ship.new("A1 C1")

    assert ship.occupies?("A1")
    assert ship.occupies?("B1")
    assert ship.occupies?("C1")
  end

end
