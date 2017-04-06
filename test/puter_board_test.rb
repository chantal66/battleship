require './test/test_helper'
require './lib/player'
require './lib/puter_board'
require './lib/validate_posibilities.rb'
require 'pry'

class PuterBoardTest < Minitest::Test
  include ValidatePosibilities

  def test_puter_board_exists 
    puter = PuterBoard.new

    assert_instance_of PuterBoard, puter
  end

  def test_can_generate_random_location
    puter = PuterBoard.new
    result = puter.random_locations

    assert result
  end

  def test_it_has_ships_to_play_with
    puter = PuterBoard.new
    result = puter.board.player_ships

    assert result
  end

  def test_it_handles_hits_and_misses
    puter = PuterBoard.new
    result = puter.board.player_hits_and_misses

    assert result
  end

  def test_can_generate_random_location
    puter = PuterBoard.new
    result = puter.random_locations

    assert result
  end

  def test_can_select_one_valid_locations_randomly
    puter = PuterBoard.new
    result = puter.random_locations
    
    assert puter.board.player_ships.valid_positions.include?(result)
  end

  def test_puter_can_select_next_location_randomly
    puter = PuterBoard.new
    result = puter.next_valid_position('C2')
    possibilities = ["D2", "C3", "B2", "C1"]
    
    assert possibilities.include?(result)
  end

  def test_can_place_a_two_unit_ship
    puter = PuterBoard.new
    result = puter.placing_ships_randomly(2)
    board = puter.board.player_ships.board
    
    assert board, result
  end

  def test_can_place_a_three_unit_ship
    puter = PuterBoard.new
    board = puter.board.player_ships.board
    result = puter.placing_ships_randomly(3)
    
    assert board, result
  end

  def test_can_place_two_and_the_three_unit_ship
    puter1 = PuterBoard.new
    board1 = puter1.board.player_ships.board
    result1 = puter1.placing_ships_randomly(3)
    
    puter2 = PuterBoard.new
    board2 = puter2.board.player_ships.board
    result2 = puter2.placing_ships_randomly(2)
    
    assert board1,result1
    assert board2, result2
  end
end