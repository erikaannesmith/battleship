require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_state'
require './lib/torpedo'

class GameStateTest < MiniTest::Test

  def test_game_state_exists
    gamestate = GameState.new([], [])

    assert_instance_of GameState, gamestate
  end

  def test_game_state_initializes_with_empty_torpedoes_list
    gamestate = GameState.new([], [])

    assert_equal [], gamestate.torpedoes
  end

  def test_a_torpedo_can_be_fired
    gamestate = GameState.new([], [])
    gamestate.fire_torpedo("A2")
    positions = gamestate.torpedoes.map {|t| t.position}

    assert_equal ["A2"], positions
  end

  def test_current_player_if_odd
    gamestate = GameState.new([], [])
    gamestate.fire_torpedo("A3")
    gamestate.fire_torpedo("A2")
    gamestate.fire_torpedo("B3")

    assert_equal "computer", gamestate.current_player.name
  end

  def test_current_player_if_even
    gamestate = GameState.new([], [])
    gamestate.fire_torpedo("A3")
    gamestate.fire_torpedo("A2")
    gamestate.fire_torpedo("B3")
    gamestate.fire_torpedo("D2")

    assert_equal "player", gamestate.current_player.name
  end
end
