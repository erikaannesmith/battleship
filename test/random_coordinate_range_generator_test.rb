require 'minitest/autorun'
require 'minitest/pride'
require './lib/ui/random_coordinate_range_generator'

class RandomCoordinateRangeGeneratorTest < MiniTest::Test
  def test_generate_is_good_for_100_tries_for_2
    100.times do
      coord = RandomCoordinateRangeGenerator.new.generate(2)
      assert coord
    end
  end

  def test_generate_is_good_for_100_tries_for_3
    100.times do
      coord = RandomCoordinateRangeGenerator.new.generate(3)
      assert coord
    end
  end
end
