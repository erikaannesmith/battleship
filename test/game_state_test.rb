require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_state'

class GameStateTest < MiniTest::Test

  def test_game_state_exists
    gamestate = GameState.new

    assert_instance_of GameState, gamestate
  end
end
