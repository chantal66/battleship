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

  def test_shots_default_to_zero
    player = Player.new
    result = player.shots

    assert_equal 0, result
  end

  def test_can_player_fire_a_shot
    
  end
end