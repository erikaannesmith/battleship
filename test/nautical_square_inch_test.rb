require 'minitest/autorun'
require 'minitest/pride'
require './lib/nautical_square_inch'

class NauticalSquareInchTest < MiniTest::Test

  def test_the_nautical_square_inch_exists
    inch = NauticalSquareInch.new("A1")

    assert_instance_of NauticalSquareInch, inch
  end

  def test_it_can_call_position
    inch = NauticalSquareInch.new("A1")

    assert_equal "A1", inch.position
  end
end
