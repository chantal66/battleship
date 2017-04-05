require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test
  def test_player_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_can_place_a_ship_in_certain_position
    player = Player.new
    result = player.ship_position(2,'A1')

    assert_equal [["==========="],
                 [". ", "1 ", "2 ", "3 ", "4 "], 
                 ["A", "2", " ", " ", " "], 
                 ["B", " ", " ", " ", " "], 
                 ["C", " ", " ", " ", " "], 
                 ["D", " ", " ", " ", " "], 
                 ["==========="]], result
  end

  def test_can_place_a_ship_in_many_positions
    player = Player.new
    result = player.ship_position(2,'B1 B2')

    assert_equal [["==========="],
                 [". ", "1 ", "2 ", "3 ", "4 "], 
                 ["A", " ", " ", " ", " "], 
                 ["B", "2", "2", " ", " "], 
                 ["C", " ", " ", " ", " "], 
                 ["D", " ", " ", " ", " "], 
                 ["==========="]], result
  end

  def test_player_has_a_board_to_play_with
    player = Player.new
    result = player.board

    assert [["==========="], 
            [". ", "1 ", "2 ", "3 ", "4 "], 
            ["A", " ", " ", " ", " "], 
            ["B", " ", " ", " ", " "], 
            ["C", " ", " ", " ", " "], 
            ["D", " ", " ", " ", " "], 
            ["==========="]], result
  end

  def test_player_has_a_board_to_track_hits
    player = Player.new
    result = player.board.add_player_hits_and_misses('A2', 'H')

    assert_equal 'H', result
  end

  def test_player_has_a_board_to_track_misses
    player = Player.new
    result = player.board.add_player_hits_and_misses('A3', 'M')

    assert_equal 'M', result
  end

  def test_location_can_not_use_twice_w_two_unit_ship
    player = Player.new
    result = player.ship_position(2, 'A1 A2')
    
    refute player.board.player_ships.valid_positions.include?('A1'), result
    refute player.board.player_ships.valid_positions.include?('A2'), result
  end

  def test_location_can_not_use_twice_w_three_unit_boat
    player = Player.new
    result = player.ship_position(3, 'B1 B2 B3')
    
    refute player.board.player_ships.valid_positions.include?('B1'), result
    refute player.board.player_ships.valid_positions.include?('B2'), result
    refute player.board.player_ships.valid_positions.include?('B3'), result
  end

  def test_shots_default_to_zero
    player = Player.new
    result = player.shots

    assert_equal 0, result
  end

  def test_can_player_fire_a_shot_and_delete_position_from_board
    player = Player.new
    fire_a_shot = player.fire('A2')
    result = player.board.player_hits_and_misses.valid_positions
    
    refute result.include?('A2')
  end
end