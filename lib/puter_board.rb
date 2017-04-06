require './lib/player'
require './lib/validate_posibilities.rb'

class PuterBoard < Player 
  
   include ValidatePosibilities

  def random_locations
    board.player_ships.valid_positions.sample
  end

  def placing_ships_randomly(ship_size)
    coord = []
    location = random_locations
    coord << location
    next_location = next_valid_position(location)
    coord << next_location
    if ship_size == 3
      location_three = check_third_position(coord.sort)
      coord << location_three
    end  
    ship_position(ship_size,coord.sort.join(' '))
  end

  def check_third_position(present_location)
    if present_location[0][0] == present_location[1][0]
      horizontal_alignment(present_location)
    else
      vertical_alignment(present_location)
    end
  end

  def next_valid_position(previous_location)
    next_position = 'next'
    until all_adjacent_locations(previous_location).include?(next_position)
      next_position = random_locations
    end
    next_position
  end
end

