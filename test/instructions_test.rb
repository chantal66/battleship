require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'


class InstructionsTest < Minitest::Test
  def test_it
    intro = Instructions.new

    assert_instance_of Instructions, intro
  end
end