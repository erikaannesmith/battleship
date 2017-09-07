require './lib/ui/random_coordinate_range_generator'
require './lib/coordinate_range'
require './lib/ship'
require './lib/ui/game_screen'

class ShipPlacementScreen
  LENGTH_OF_SHIPS_TO_GENERATE = [2, 3]

  attr_reader :computer_ships, :player_ships

  def initialize
    @computer_ships = []
    @player_ships = []
  end

  def start!
    LENGTH_OF_SHIPS_TO_GENERATE.each do |ship_length|
      computer_ships << generate_computer_ship(ship_length)
    end

    puts "I have laid out my ships on the grid.
You now need to layout your two ships.
The first is two units long and the
second is three units long.
The grid has A1 at the top left and D4 at the bottom right."

    # puts "Computer has placed its ships at: #{computer_spots}"

    LENGTH_OF_SHIPS_TO_GENERATE.each do |ship_length|
      player_ships << gather_user_ship(ship_length)
    end

    puts "Your ships have successfully set sail. Prepare your weapons..."

    GameScreen.new(computer_ships, player_ships).start!
  end

  private

  def gather_user_ship(ship_length)
    puts "Enter the squares for the #{ship_length}-unit ship:"

    hypothetical_coords = gets.chomp
    hypothetical_ship = Ship.new(hypothetical_coords)

    if hypothetical_ship.in_ocean?
      if hypothetical_ship.ship_length == ship_length
        if these_dont_hypothetically_collide(player_ships, hypothetical_ship)
          puts "MONEY"
          hypothetical_ship
        else
          puts "I hope you like shipwrecks... Try again."
          gather_user_ship(ship_length)
        end
      else
        puts "That ship is totally not #{ship_length} nautical square inches! Try again."
        gather_user_ship(ship_length)
      end
    else
      puts "That ship wouldn't even be in the ocean! Try again."
      gather_user_ship(ship_length)
    end
  end

  def generate_computer_ship(ship_length)
    generator = RandomCoordinateRangeGenerator.new
    hypothetical_coords = generator.generate(ship_length)
    hypothetical_ship = Ship.new(hypothetical_coords)

    if these_dont_hypothetically_collide(computer_ships, hypothetical_ship)
      return hypothetical_ship
    end

    generate_computer_ship(ship_length)
  end

  def these_dont_hypothetically_collide(buncha_ships, particular_ship)
    particular_coords = particular_ship.coordinate_range.coordinates

    !buncha_ships.any? do |some_ship|
      particular_coords.any? do |coord|
        some_ship.occupies?(coord)
      end
    end
  end
end
