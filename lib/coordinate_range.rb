class CoordinateRange
  attr_reader :bow, :stern

  def initialize(coord_string)
    @bow, @stern = coord_string.split(" ").sort
  end

  def include?(coordinate)
    coordinates.include?(coordinate)
  end

  def coordinates
    x_line = (bow[0]..stern[0])
    y_line = (bow[-1]..stern[-1])

    Ocean::COORDINATES.select do |coordinate|
      x = coordinate[0]
      y = coordinate[-1]

      x_line.include?(x) && y_line.include?(y)
    end
  end

  def length
    coordinates.length
  end
end
