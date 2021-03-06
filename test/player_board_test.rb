require './test/test_helper'
require './lib/board'
require './lib/player_board'
require 'pry'

class PlayerBoardTest < Minitest::Test
  def test_player_board_exists
    player_board = PlayerBoard.new

    assert_instance_of PlayerBoard, player_board
  end

  def test_board_can_track_player_hits_and_misses
    player_board = PlayerBoard.new 
    result = player_board.player_hits_and_misses

    assert result
  end

  def test_board_can_track_player_ships
    player_board = PlayerBoard.new 
    result = player_board.player_ships

    assert result
  end

  def test_can_convert_a_letter_into_appropiate_board_index
    player_board = PlayerBoard.new
    result = player_board.swapp_letter('A')

    assert_equal 2, result
  end

  def test_can_convert_many_letters_into_appropiate_board_index
    player_board = PlayerBoard.new
    result1 = player_board.swapp_letter('B')
    result2 = player_board.swapp_letter('C')
    result3 = player_board.swapp_letter('D')

    assert_equal 3, result1
    assert_equal 4, result2
    assert_equal 5, result3
  end

  def test_can_add_a_hit_when_appropiate
    hit_index = PlayerBoard.new
    result = hit_index.swapp_letter('A')
    hit = PlayerBoard.new
    result1 = hit.add_player_hits_and_misses('A1', 'H')
   
    assert_equal 'H', result1
  end

  def test_can_add_a_hit_when_appropiate
    miss_index = PlayerBoard.new
    result1 = miss_index.swapp_letter('C')
    miss = PlayerBoard.new
    result2 = miss.add_player_hits_and_misses('C2', 'M')

    assert_equal 'M', result2
  end
end