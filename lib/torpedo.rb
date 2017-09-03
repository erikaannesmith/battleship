class Torpedo
  attr_reader :position, :shooter

  def initialize(shooter, position)
    @shooter = shooter
    @position = position
  end

end
