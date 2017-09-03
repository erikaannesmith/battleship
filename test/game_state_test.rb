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
end
