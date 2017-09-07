class RandomCoordinateGeneratorTest < MiniTest::Test

  def test_find_random_coordinate
    rcg = RandomCoordinateGenerator.new

    assert Ocean::COORDINATES.include?(rcg.find_random_coordinate)
  end

end
