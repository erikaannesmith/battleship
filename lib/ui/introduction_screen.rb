require './lib/ui/ship_placement_screen'

class IntroductionScreen

  def start!
    puts "Welcome to BATTLESHIP"
    determine_next_action
  end

  private

  def determine_next_action
    puts
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    handle_answer
  end

  def handle_answer(answer = gets.chomp)
    if answer == "p"
      puts "Let's begin!"
      ShipPlacementScreen.new.start!
    elsif answer == "i"
      puts "Here are some instructions!"
      handle_answer
    elsif answer == "q"
      puts "Sorry to see you leave!"
    else
      puts "That is not a valid input!"
      handle_answer
    end
  end

end
