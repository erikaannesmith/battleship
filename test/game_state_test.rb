require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_state'
require './lib/torpedo'

class GameStateTest < MiniTest::Test

  def test_game_state_exists
    gamestate = GameState.new

    assert_instance_of GameState, gamestate
  end

  def test_game_state_initializes_with_empty_torpedoes_list
    gamestate = GameState.new

    assert_equal [], gamestate.torpedoes
  end

  def test_a_torpedo_can_be_fired
    gamestate = GameState.new
    gamestate.fire_torpedo("player 1", "A2")
    positions = gamestate.torpedoes.map {|t| t.position}

    assert_equal ["A2"], positions
  end
end
