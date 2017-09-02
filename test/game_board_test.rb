require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_board'

class GameBoardTest < MiniTest::Test

  def test_the_gameboard_exists
    gameboard = GameBoard.new

    assert_instance_of GameBoard, gameboard
  end

  def test_has_an_inch_for_each_coordinate
    gameboard = GameBoard.new
    positions = gameboard.inches.map{|inch| inch.position}

    assert_equal positions, GameBoard::COORDINATES
  end
end
