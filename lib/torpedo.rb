class Torpedo
  attr_reader :position, :player

  def initialize(player, position)
    @player = player
    @position = position
  end

end
