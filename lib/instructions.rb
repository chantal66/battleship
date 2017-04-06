class Instructions
  
  def self.welcome_message
    "Welcome to BATTLESHIP"
  end

  def self.menu_message
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.instructions_message
    "Maybe I'm NOT very smart according to my creator but I will sink your FLEET anyways\n
    Now! a piece of advice..\n
    Should you pack your battleships closely together or spread them far apart?
    Is it best to sink your opponent's ship right away or locate the other ships first?"
  end

  def self.placement_ship_instructions
    "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.

    Enter the squares for the two-unit ship: "
  end

  def self.ship_placement(size_ship)
    "Enter the squares for the #{size_ship} ship."
  end
  
  def self.invalid_entry(rule_violated)
    "Invalid: your input #{rule_violated}.
    Please try again.\n\n"
  end

  def self.player_quits
    'Thanks for playing. See you next time!'
  end

  def self.incorrect_length
    'is not the correct length'
  end

  def self.too_many_characters
    "includes at least one location with too many characters - try something like 'B2' for each location"
  end

  def self.duplicates
    'cannot include duplicates'
  end

  def self.format_or_range_issue
    "should start with a letter between 'A' and 'D' and end with a number between '1' and '4', i.e. 'A3'"
  end

  def self.wraps
    'wraps around the board'
  end
   
   def self.already_taken
    "location already taken"
  end

  def self.not_adjacent
    "includes locations that are diagonal or otherwise non-adjacent"
  end

  def self.shot_locs
    'should only be one location'
  end

  def self.shot_length
    'should only be two characters'
  end

  def self.already_guessed
    'is a location you have already guessed'
  end

  def self.rules_violations(violations)
    "NO NO NO, please enter a valid size"
  end

  def self.attacking_prompt
    "Please enter the firing instructions: "
  end

  def self.attack_prompt
    'Please enter a position to fire on: '
  end

  def self.hit(position)
    "Shot on #{position} was a hit!\n\n"
  end

  def self.miss(position)
    "Shot on #{position} was a miss.\n\n"
  end

  def self.player_end_turn
    "Please press ENTER to end your turn.\n\n"
  end

  def self.sunken_ship(size)
    "A #{size} ship has been sunk!"
  end

  def self.end_game(outcome, num_shots, time)
    if outcome == 'W'
      "Congratulations! You beat the computer in #{time / 60} minutes and #{time % 60} seconds, and it only took you #{num_shots} shots! Thanks for playing!"
    else
      "So sorry, you lost. The computer beat you in #{time / 60} minutes and #{time % 60} seconds, but it did take them #{num_shots} shots to do it. Thanks for playing!"
    end
  end

  def self.player_quits
    'Thanks for playing. See you next time!'
  end  

  def self.computer_turn
    "The computer takes a shot...\n"
  end

  def self.computer_board
    "The computer's hits and misses are as follows:"
  end

  def self.current_player_board
    "Here's your current board tracking your hits and misses:"
  end

  def self.updated_player_board
    'After that guess, your hits and misses are as follows:'
  end

  def self.not_valid
    'is not a valid choice'
  end

  def self.enter_only
    'should only be the ENTER key'
  end
end