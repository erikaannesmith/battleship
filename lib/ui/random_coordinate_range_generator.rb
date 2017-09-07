require './lib/ui/random_coordinate_generator'
require './lib/ocean'
require 'pry'
class RandomCoordinateRangeGenerator

  def generate(ship_length)
    distance = ship_length - 1
    first_coord = generate_random_coordinate
    second_coord = pair_for_random_coordinate(first_coord, distance)
    "#{first_coord} #{second_coord}"
  end

  private

  def generate_random_coordinate
    RandomCoordinateGenerator.new.generate
  end

  def pair_for_random_coordinate(random_coordinate, distance)
    x_letter, y = random_coordinate.split("")
    x = Ocean::X_COORDS.to_a.index(x_letter)

    possible_pairs = [
      [x.to_i - distance, y],
      [x.to_i + distance, y],
      [x, y.to_i - distance],
      [x, y.to_i + distance],
    ]

    pairs_on_board = possible_pairs.select do |x,y|
      x.to_i.positive? && y.to_i.positive? && Ocean::COORDINATES.include?(numbers_to_coordinate(x,y))
    end

    new_x, new_y = pairs_on_board.sample

    numbers_to_coordinate(new_x, new_y)
  end

  def numbers_to_coordinate(x, y)
    x_letter = Ocean::X_COORDS.to_a[x]

    "#{x_letter}#{y}"
  end

end
