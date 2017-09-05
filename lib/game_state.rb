require './lib/torpedo'

class GameState
  attr_reader :torpedoes, :players

  def initialize
    @torpedoes = []
    @players = {
      one: Player.new("player"),
      two: Player.new("computer")
    }
  end

  def fire_torpedo(player, position)
    torpedo = Torpedo.new(player, position)
    torpedoes << torpedo
  end

  def current_player
    players[
      if torpedoes.count % 2 == 0
        :one
      else
        :two
      end
    ]
  end
end
