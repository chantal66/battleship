require './test/test_helper'
require './lib/instructions'
require 'pry'


class InstructionsTest < Minitest::Test
  def test_it_exists
    intro = Instructions.new

    assert_instance_of Instructions, intro
  end

  def test_it_can_give_a_welcome_message
    intro = Instructions.welcome_message

    assert_equal "Welcome to BATTLESHIP", intro
  end

  def test_it_can_give_a_menu_message
    intro = Instructions.menu_message

    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", intro
  end

  def test_it_can_give_the_instructions_message
    intro = Instructions.instructions_message

    assert_equal "Maybe I'm NOT very smart according to my creator but I will sink your FLEET anyways\n
    Now! a piece of advice..\n
    Should you pack your battleships closely together or spread them far apart?
    Is it best to sink your opponent's ship right away or locate the other ships first?", intro
  end

  def test_can_give_ship_placement_instructions
    intro = Instructions.placement_ship_instructions

    assert_equal "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.

    Enter the squares for the two-unit ship: ", intro
  end

   def test_it_has_a_ship_placement_prompt_for_multiple_ship_sizes
    intro = Instructions.ship_placement('two-unit')
    message = 'Enter the squares for the two-unit ship.'
    assert_equal message, intro
    result = Instructions.ship_placement('three-unit')
    message = 'Enter the squares for the three-unit ship.'
    assert_equal message, result
  end

  def test_it_has_a_prompt_for_position_to_fire_on
    intro = Instructions.attack_prompt
    message = 'Please enter a position to fire on: '
    assert_equal message, intro
  end

  def test_it_has_a_flexible_message_for_a_hit
    result = Instructions.hit('A3')
    assert_equal "Shot on A3 was a hit!\n\n", result
  end

  def test_it_has_a_flexible_message_for_a_miss
    result = Instructions.miss('B4')
    assert_equal "Shot on B4 was a miss.\n\n", result
  end

  def test_it_has_a_message_to_prompt_the_player_to_end_their_turn
    result = Instructions.player_end_turn
    message = "Please press ENTER to end your turn.\n\n"
    assert_equal message, result
  end

  def test_it_has_a_message_for_a_sunken_ship
    result = Instructions.sunken_ship('three-unit')
    message = 'A three-unit ship has been sunk!'
    assert_equal message, result
  end

    def test_it_has_a_flexible_message_for_the_end_game
    result = Instructions.end_game('W', 12, 11)
    message = "Congratulations! You beat the computer in 0 minutes and 11 seconds, and it only took you 12 shots! Thanks for playing!"
    assert_equal message, result
    result = Instructions.end_game('L', 12, 30)
    message = "So sorry, you lost. The computer beat you in 0 minutes and 30 seconds, but it did take them 12 shots to do it. Thanks for playing!"
    assert_equal message, result
  end

  def test_it_has_a_message_for_when_the_player_quits
    result = Instructions.player_quits
    message = 'Thanks for playing. See you next time!'
    assert_equal message, result
  end

  def test_it_has_a_message_to_announce_the_computer_turn
    result = Instructions.computer_turn
    message = "The computer takes a shot...\n"
    assert_equal message, result
  end

  def test_it_has_a_message_announcing_the_computer_hit_and_miss_board
    result = Instructions.computer_board
    message = "The computer's hits and misses are as follows:"
    assert_equal message, result
  end

  def test_it_has_a_message_announcing_the_player_hit_and_miss_board
    result = Instructions.current_player_board
    message = "Here's your current board tracking your hits and misses:"
    assert_equal message, result
  end

  def test_it_has_a_message_for_the_updated_player_hit_and_miss_board
    result = Instructions.updated_player_board
    message = 'After that guess, your hits and misses are as follows:'
    assert_equal message, result
  end

  def test_it_has_a_message_for_an_invalid_choice
    result = Instructions.not_valid
    message = 'is not a valid choice'
    assert_equal message, result
  end

  def test_it_has_a_message_for_asking_for_the_ENTER_key_only
    result = Instructions.enter_only
    message = 'should only be the ENTER key'
    assert_equal message, result
  end

  def test_it_has_a_message_for_a_location_already_guessed
    result = Instructions.already_guessed
    message = 'is a location you have already guessed'
    assert_equal message, result
  end

  def test_it_has_a_message_for_incorrect_shot_length
    result = Instructions.shot_length
    message = 'should only be two characters'
    assert_equal message, result
  end

  def test_it_has_a_message_for_too_many_locations
    result = Instructions.shot_locs
    message = 'should only be one location'
    assert_equal message, result
  end

  def test_it_has_a_message_for_an_incorrect_length
    result = Instructions.incorrect_length
    message = 'is not the correct length'
    assert_equal message, result
  end

  def test_it_has_a_message_for_placement_that_is_not_adjacent
    result = Instructions.not_adjacent
    message = "includes locations that are diagonal or otherwise non-adjacent"
    assert_equal message, result
  end

  def test_it_has_a_message_for_a_location_that_is_already_taken
    result = Instructions.already_taken
    message = "location already taken"
    assert_equal message, result
  end

  def test_it_has_a_message_for_positions_that_wrap_the_board
    result = Instructions.wraps
    message = 'wraps around the board'
    assert_equal message, result
  end

  def test_it_has_a_message_for_duplicates
    result = Instructions.duplicates
    message = 'cannot include duplicates'
    assert_equal message, result
  end

  def test_it_has_a_message_for_format_or_range_issues
    result = Instructions.format_or_range_issue
    message = "should start with a letter between 'A' and 'D' and end with a number between '1' and '4', i.e. 'A3'"
    assert_equal message, result
  end

  def test_it_has_a_message_for_too_many_characters
    result = Instructions.too_many_characters
    message = "includes at least one location with too many characters - try something like 'B2' for each location"
    assert_equal message, result
  end
end