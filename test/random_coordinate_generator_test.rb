class RandomCoordinateGeneratorTest < MiniTest::Test

  def test_generate
    rcg = RandomCoordinateGenerator.new

    assert Ocean::COORDINATES.include?(rcg.generate)
  end

end
