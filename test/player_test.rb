require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test
  def test_player_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_shots_default_to_zero
    player = Player.new
    result = player.shots

    assert_equal 0, result
  end

  def test_can_track_a_two_unit_ship
    player = Player.new

    binding.pry
  end

  def test_can_track_a_three_unit_ship
    
  end
end