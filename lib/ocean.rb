require './lib/nautical_square_inch'

class Ocean
  attr_reader :inches


  X_COORDS = "A".."D"
  Y_COORDS = 1..4
  COORDINATES = X_COORDS.to_a.product(Y_COORDS.to_a).map {|x,y| "#{x}#{y}"}

  def initialize
    @inches = COORDINATES.map {|space| NauticalSquareInch.new(space)}
  end

end
