require './lib/ocean'
require './lib/coordinate_range'

class Ship
  attr_reader :coordinate_range

  def initialize(coord_string)
    @coordinate_range = CoordinateRange.new(coord_string)
  end

  def occupies?(coordinate)
    coordinate_range.include?(coordinate)
  end

  def in_ocean?
    Ocean::COORDINATES.include?(coordinate_range.bow) &&
      Ocean::COORDINATES.include?(coordinate_range.stern)
  end

  def ship_length
    coordinate_range.length
  end
end
