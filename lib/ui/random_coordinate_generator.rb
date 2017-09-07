require './lib/Ocean.rb'

class RandomCoordinateGenerator

  def find_random_coordinate
    Ocean::COORDINATES.sample
  end

end
