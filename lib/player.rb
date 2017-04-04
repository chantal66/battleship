require './lib/player_board'

class Player
  
  attr_reader :shots, :board

  def initialize(shots = 0)
    @shots = shots
    @board = PlayerBoard.new
  end

  def ship_position(ship_size, position)
    positions = position.split
    positions.each do |location|
      row = board.swapp_letter(location[0])
      board.player_ships.board[row][location[1].to_i] = ship_size.to_s
    end  
    board.player_ships.board
  end
end

# player = Player.new

# p player.board.add_player_hits_and_misses('A2', 'H')