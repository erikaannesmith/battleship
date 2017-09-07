require './lib/game_state'
require './lib/ocean'
require './lib/ui/random_coordinate_generator'
require './lib/ui/screen_printer'

class GameScreen
  attr_reader :computer_ships, :player_ships, :game_state

  def initialize(computer_ships, player_ships)
    @computer_ships = computer_ships
    @player_ships = player_ships
    @game_state = GameState.new(computer_ships, player_ships)
  end

  def start!
    take_a_turn while its_not_over?
  end

  private

  def take_a_turn
    take_player_turn
    take_computer_turn
  end

  def take_player_turn
    print_the_screen

    hypothetical_coords = gets.chomp
    if Ocean::COORDINATES.include?(hypothetical_coords)
      location_already_torpedoed = game_state.torpedoes.any? do |torpedo|
        torpedo.player.name == game_state.current_player.name &&
          torpedo.position == hypothetical_coords
      end

      unless location_already_torpedoed
        game_state.fire_torpedo(hypothetical_coords)
        report_the_damage

        puts "Press ENTER to end your turn."
        gets.chomp
      else
        puts "You've already shot there!"
        take_player_turn
      end
    else
      puts "You fool! That coordinate isn't even in the ocean."
      puts "Where were you aiming!?"

      take_player_turn
    end
  end

  def take_computer_turn
    hypothetical_coords = RandomCoordinateGenerator.new.generate
    puts "Computer shooting at #{hypothetical_coords}"
    game_state.fire_torpedo(hypothetical_coords)
    report_the_damage
  end

  def report_the_damage
    last_torpedo = game_state.torpedoes.last
    if last_torpedo.was_hit
      puts "Hit!"
    else
      puts "Miss!"
    end
  end

  def its_not_over?
    true
  end

  def print_the_screen
    ScreenPrinter.new(game_state).print!
  end
end
