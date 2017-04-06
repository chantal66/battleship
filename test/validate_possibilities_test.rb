require './test/test_helper'
require './lib/validate_posibilities'
require './lib/player'
require 'pry'
class ValidatePosibilitiesTest < Minitest::Test
  include ValidatePosibilities

  def test_it_can_find_vertical_aligment_for_three_unit
    result = vertical_alignment(['A1','B1'])

    assert_equal 'C1', result
  end

  def test_it_can_find_horizontal_alignmet_for_three_unit
    result = horizontal_alignment(['A1','A2'])

    assert_equal 'A3', result
  end

  def test_it_can_find_and_return_all_adjacent_locations
    result = all_adjacent_locations('A1')
    possibilities = ['B1', 'A2', '@1', 'A0']
    assert_equal possibilities, result
  end

  def test_it_knows_if_a_single_input_is_in_the_wrong_format_or_off_the_board
    result = position_wrong_format_or_outside_range?(['A9'])
    assert result
    result = position_wrong_format_or_outside_range?(['1B'])
    assert result
    result = position_wrong_format_or_outside_range?(['A2'])
    refute result
  end

  def test_it_knows_if_multiple_inputs_are_wrong_format_or_off_board
    result = position_wrong_format_or_outside_range?(['A1', 'A2'])
    refute result
    result = position_wrong_format_or_outside_range?(['A1', 'B5'])
    assert result
  end

  def test_it_can_detect_duplicates_in_an_input_of_locations
    result = positions_include_duplicates?(['A1', 'A2', 'A3'])
    refute result
    result = positions_include_duplicates?(['A1','A2','A2'])
    assert result
  end

  def test_it_can_tell_if_an_input_wraps_around_the_board
    result = position_wraps?(['A1','D1'])
    assert result
    result = position_wraps?(['B2','C2'])
    refute result
  end

  def test_it_can_tell_if_an_input_contains_a_specific_character
    result = contains(['A1','A2'], 'A')
    assert result
    result = contains(['A1','A2'], '4')
    refute result
  end

  def test_it_can_tell_if_inputs_are_diagnonal_or_non_adjacent
    result = positions_not_adjacent?(['A2','C3'])
    assert result
    result = positions_not_adjacent?(['A2','A3'])
    refute result
  end

  def test_it_can_tell_if_a_location_has_already_been_guessed
    player = Player.new
    result = already_guessed?('A1', player)
    refute result
    player.board.player_hits_and_misses.valid_positions.delete('A1')
    result = already_guessed?('A1', player)
    assert result
  end
end
