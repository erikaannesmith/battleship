require './lib/ui/random_coordinate_generator'
require './lib/ocean'

class RandomCoordinateRangeGenerator

  def generate
    pair_for_random_coordinate(generate_random_coordinate)
  end

  private

  def generate_random_coordinate
    RandomCoordinateGenerator.new.find_random_coordinate
  end

  def pair_for_random_coordinate(random_coordinate)
    x_letter, y = random_coordinate.split("")
    x = X_COORDS.to_a.index(x_letter)

    possible_pairs = [[x-1,y],[x+1,y],[x,y-1],[x,y+1]]

    pairs_on_board = possible_pairs.select do |x,y|
      (x>0 && x<4) && (y>0 && y<4)
    end

    new_x, new_y = pairs_on_board.sample
    new_x_letter = X_COORDS.to_a[new_x]

    "#{new_x_letter}#{new_y}"
  end

end
