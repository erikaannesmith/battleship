require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < MiniTest::Test

  def test_player_exists
    player1 = Player.new("player 1")

    assert_instance_of Player, player1
  end

  def test_it_has_a_name
    player1 = Player.new("Erika")

    assert_equal "Erika", player1.name
  end
end
