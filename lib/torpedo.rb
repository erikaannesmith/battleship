class Torpedo
  attr_reader :position, :player, :was_hit

  def initialize(player, position, was_hit)
    @player = player
    @position = position
    @was_hit = was_hit
  end
end
