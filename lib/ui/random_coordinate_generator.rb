require './lib/Ocean.rb'

class RandomCoordinateGenerator
  def generate
    find_random_coordinate
  end

  private

  def find_random_coordinate
    Ocean::COORDINATES.sample
  end
end
