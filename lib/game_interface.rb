require './lib/instructions'
require './lib/validate_posibilities'
require 'pry'
class PlayerInterface
  extend ValidatePosibilities

  def self.menu_message(player)
    puts Instructions.menu_message
    selection = gets.chomp.upcase
    if quitting?(selection)
      quit
    elsif selection == 'I' || selection == 'INSTRUCTIONS'
      puts Instructions.instructions_message
      sleep(3)
      menu_message(player)
    elsif selection == 'P' || selection == 'PLAY'
      puts Instructions.placement_ship_instructions
      first_ship = ship_placement(2, player)
      player.ship_position(2, first_ship)
      second_ship = ship_placement(3, player)
      player.ship_position(3, second_ship)
    else
      puts Instructions.invalid_entry(Instructions.not_valid)
      menu_message(player)
    end
  end

  def self.quitting?(input)
    true if input == 'Q' || input == 'QUIT'
  end

  def self.quit
    puts Instructions.player_quits
    exit
  end

  def self.invalid_try_again(reason)
    puts Instructions.invalid_entry(reason)
  end

  def self.ship_placement(ship_size, player)
    locations = []
    puts Instructions.ship_placement("#{ship_size}-unit")
    location = gets.chomp.upcase
    if ship_placement_verification(location, ship_size, player)
      ship_placement(ship_size, player)
    else
      locations << location
      return locations.sort.join(' ')
    end
  end

  def self.ship_placement_verification(location, ship_size, player)
    outcome = true
    entries = location.split
    if quitting?(location)
      quit
    elsif entries.size != ship_size
      invalid_try_again(Instructions.incorrect_length)
    elsif too_many_letters?(entries)
      invalid_try_again(Instructions.too_many_characters)
    elsif position_wrong_format_or_outside_range?(entries)
      invalid_try_again(Instructions.format_or_range_issue)
    elsif positions_include_duplicates?(entries)
      invalid_try_again(Instructions.duplicates)
    elsif position_wraps?(entries)
      invalid_try_again(Instructions.wraps)
    elsif position_taken?(entries, player)
      invalid_try_again(Instructions.already_taken)
    elsif positions_not_adjacent?(entries)
      invalid_try_again(Instructions.not_adjacent)
    else
      outcome = false
    end
    outcome
  end
end
# require 'pry'; binding.pry
# ''
p player = PlayerInterface.menu_message('p')
