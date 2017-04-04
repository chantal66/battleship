require 'minitest/autorun'
require 'minitest/emoji'
require './lib/instructions'
require 'pry'


class InstructionsTest < Minitest::Test
  def test_it_exists
    intro = Instructions.new

    assert_instance_of Instructions, intro
  end

  def test_it_can_give_a_welcome_message
    intro = Instructions.new
    result = intro.welcome_message

    assert_equal "Welcome to BATTLESHIP", result
  end

  def test_it_can_give_a_welcome_message
    intro = Instructions.new
    result = intro.menu_message

    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", result
  end

  def test_it_can_give_the_instructions_message
    intro = Instructions.new
    result = intro.instructions_message

    assert_equal "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.

    Enter the squares for the two-unit ship: ", result
  end
end