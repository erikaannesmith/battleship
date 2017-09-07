require './lib/ui/ship_placement_screen'

class Introduction

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
      computer_place_ships
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
