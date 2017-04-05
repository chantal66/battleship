require './lib/player'
class PutterBoard < Player 
  
  def random_locations
    board.player_ships.valid_positions.sample
  end
  
  def ships_random_position(ship_size)
    location_coordinates = []
    loca
  end
end

putter = PutterBoard.new
p putter.random_locations
