require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'
require './lib/putter_board'
require 'pry'

class PutterBoardTest < Minitest::Test
  def test_putter_board_exists 
    putter = PutterBoard.new

    assert_instance_of PutterBoard, putter
  end

  def test_can_generate_random_location
    putter = PutterBoard.new
    result = putter.random_locations

    assert result
  end

  def test_it_has_ships_to_play_with
    putter = PutterBoard.new
    result = putter.board.player_ships

    assert result
  end

  def test_it_handles_hits_and_misses
    putter = PutterBoard.new
    result = putter.board.player_hits_and_misses

    assert result
  end

  def test_can_generate_random_location
    putter = PutterBoard.new
    result = putter.random_locations

    assert result
  end

  def test_can_select_valid_locations_randomly
    putter = PutterBoard.new
    result = putter.random_locations
    # binding.pry
    assert putter.board.player_ships.valid_positions.include?(result)

  end
 

end