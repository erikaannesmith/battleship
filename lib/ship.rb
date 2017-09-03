require './lib/Ocean.rb'

class Ship
  attr_reader :coordinate_range

  def initialize(coordinate_range)
    @coordinate_range = coordinate_range
  end

  def occupies?(coordinate)
    coordinates.include?(coordinate)
  end

  private

  def coordinates
    split_coordinates = coordinate_range.split(" ")
    bow = split_coordinates[0]
    stern = split_coordinates[-1]
    x_line = (bow[0]..stern[0])
    y_line = (bow[-1]..stern[-1])

    Ocean::COORDINATES.select do |coordinate|
      x = coordinate[0]
      y = coordinate[-1]

      x_line.include?(x) && y_line.include?(y)
    end
  end
end
