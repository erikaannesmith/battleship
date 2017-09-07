require 'minitest/autorun'
require 'minitest/pride'
require './lib/ui/introduction_screen'

class IntroductionTest < MiniTest::Test

  def test_the_introduction_exists
    intro = IntroductionScreen.new

    assert_instance_of IntroductionScreen, intro
  end

end
