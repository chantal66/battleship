require './lib/board'
class PlayerBoard
  
  attr_reader :player_ships, :player_hits_and_misses

  def initialize
    @player_ships = Board.new
    @player_hits_and_misses = Board.new
    # binding.pry
  end

  def add_player_hits_and_misses(location, hit_or_miss)
    index = swapp_letter(location[0])
    player_hits_and_misses.board[index][location[1].to_i] = hit_or_miss
  end

  def swapp_letter(letter)
    index = 2
    if letter == 'B'
      index = 3
    elsif letter == 'C'
      index = 4
    elsif letter == 'D'
      index = 5
    else
      index  
    end      
  end
end
