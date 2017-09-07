require './lib/torpedo'
require './lib/player'

class GameState
  attr_reader :torpedoes, :players, :ships

  def initialize(computer_ships, player_ships)
    @torpedoes = []
    @players = {
      one: Player.new("player"),
      two: Player.new("computer")
    }
    @ships = {
      one: player_ships,
      two: computer_ships
    }
  end

  def fire_torpedo(coord)
    was_hit = opposing_ships.any? { |ship| ship.occupies?(coord) }
    torpedo = Torpedo.new(current_player, coord, was_hit)
    torpedoes << torpedo
  end

  def current_player
    players[current_player_id]
  end

  def opponent
    players[opponent_id]
  end

  def current_player_id
    if torpedoes.count % 2 == 0
      :one
    else
      :two
    end
  end

  def opponent_id
    if current_player_id == :one
      :two
    else
      :one
    end
  end

  def opposing_ships
    ships[opponent_id]
  end
end
