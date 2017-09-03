require './lib/torpedo'

class GameState
  attr_reader :torpedoes

  def initialize
    @torpedoes = []
  end

end
