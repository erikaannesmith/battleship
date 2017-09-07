class ScreenPrinter
  attr_reader :game_state

  def initialize(game_state)
    @game_state = game_state
  end

  def print!
    puts "==========="
    puts ". 1 2 3 4"
    puts "A " + whatever_is_in_a
    puts "B " + whatever_is_in_b
    puts "C " + whatever_is_in_c
    puts "D " + whatever_is_in_d
    puts "==========="
  end

  private

  def whatever_is_in_a
    [
      inch("A1"),
      " ",
      " ",
      " "
    ].join(' ')
  end

  def whatever_is_in_b
    [
      " ",
      " ",
      " ",
      " "
    ].join(' ')
  end

  def whatever_is_in_c
    [
      " ",
      " ",
      " ",
      " "
    ].join(' ')
  end

  def whatever_is_in_d
    [
      " ",
      " ",
      " ",
      inch("D4")
    ].join(' ')
  end

  def player
    game_state.current_player
  end

  def inch(coord)
    torpedo = game_state.torpedoes.find do |t|
      t.position == coord && t.player.name == game_state.opponent.name
    end

    if !torpedo
      " "
    elsif torpedo.was_hit
      "H"
    else
      "M"
    end
  end
end
