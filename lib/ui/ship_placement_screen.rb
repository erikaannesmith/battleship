require './lib/ui/random_coordinate_range_generator'

class ShipPlacementScreen

  def computer_place_ships
    generator = RandomCoordinateRangeGenerator.new
    [generator.ship_of_length(2),
    generator.ship_of_length(3)]
  end

end
