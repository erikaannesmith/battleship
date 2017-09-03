require 'minitest/autorun'
require 'minitest/pride'
require './lib/ocean'

class OceanTest < MiniTest::Test

  def test_the_ocean_exists
    ocean = Ocean.new

    assert_instance_of Ocean, ocean
  end

  def test_has_an_inch_for_each_coordinate
    ocean = Ocean.new
    positions = ocean.inches.map{|inch| inch.position}

    assert_equal positions, Ocean::COORDINATES
  end
end
