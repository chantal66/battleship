require 'minitest/autorun'
require 'minitest/emoji'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test
  def test_board_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_board_has_16_positions
    board = Board.new
    result = board.valid_positions.length
   
    assert_equal 16, result
  end

  def test_board_has_valid_positions
    board = Board.new
    result = board.valid_positions
   
    assert_equal ['A1', 'A2', 'A3', 'A4', 
                  'B1', 'B2', 'B3', 'B4',
                  'C1', 'C2', 'C3', 'C4',
                  'D1', 'D2', 'D3', 'D4'], result
  end

  def test_board_has_a_header_and_footer
    board = Board.new
    result = board.header_and_footer

    assert_equal '===========', result
  end

  def test_has_columns_labels_from_1_to_4
    board = Board.new
    result = board.column_label

    assert_equal ['.','1','2','3','4'], result
  end

  def test_board_has_rows_with_letter_A
    board = Board.new
    result = board.row('A')

    assert_equal ['A',' ',' ',' ',' '], result
  end

   def test_board_has_rows_with_other_letters
    board = Board.new
    result = board.row('C')

    assert_equal ['C',' ',' ',' ',' '], result
  end

  def test_has_a_full_board
  
    board = Board.new
    result = board.full_board

    assert_equal ['===========',
                  [".", "1", "2", "3", "4"],
                  ["A", " ", " ", " ", " "], 
                  ["B", " ", " ", " ", " "], 
                  ["C", " ", " ", " ", " "], 
                  ["D", " ", " ", " ", " "], 
                  '==========='], result
    
  end
end