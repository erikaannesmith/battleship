require './lib/torpedo'

class GameState
  attr_reader :torpedoes

  def initialize
    @torpedoes = []
  end

  def fire_torpedo(player, position)
    torpedo = Torpedo.new(player, position)
    @torpedoes << torpedo
  end
end
