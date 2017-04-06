module ValidatePosibilities
  def vertical_alignment(present_location) 
    if present_location[0][0] = 'A'
      final_location = 'C' + present_location[0][1]
    elsif present_location[0][0] == 'C'
      final_location = 'B' + present_location[0][1]
    else
      final_location = ['A','D'].sample + present_location[0][1]
    end
  end

  def horizontal_alignment(present_location) 
    if present_location[0][1] = '1'
      final_location = present_location[0][0] + '3'
    elsif present_location[0][1] == '3'
      final_location = present_location[0][0] + '2'
    else
      final_location = present_location[0][0] + ['1','2','3','4']
    end
  end

  def check_third_position(existing_locations)
    if existing_locations[0][0] == existing_locations[1][0]
      horizontal_alignment(existing_locations)
    else
      vertical_alignment(existing_locations)
    end
  end
  
  def all_adjacent_locations(previous_location)
    up_letter = "#{previous_location[0].next}#{previous_location[1]}"
    up_number = "#{previous_location[0]}#{previous_location[1].next}"
    down_letter = "#{(previous_location[0].ord - 1).chr}#{previous_location[1]}"
    down_number = "#{previous_location[0]}#{(previous_location[1].ord - 1).chr}"
    possibilities = [up_letter, up_number, down_letter, down_number]
  end

  def puter_possibilities(possibilities)
    possibilities.delete_at(rand(possibilities.length))
  end

  def position_wrong_format_or_outside_range?(locations)
    !locations.all? do |place|
      place[0].between?('A', 'D') && place[1].between?('1', '4')
    end
  end

  def too_many_letters?(positions)
    positions.any? { |place| place.length > 2}
  end

  def positions_include_duplicates?(positions)
    true if positions.uniq.size < positions.size
  end

  def position_wraps?(positions)
    if contains(positions, 'A') && contains(positions, 'D')
      true
    elsif contains(positions, '1') && contains(positions, '4')
      true
    else
      false
    end
  end

  def contains(positions, char)
    positions.any? { |place| place[0] == char }
  end

  def position_taken?(positions, player)
    !positions.all? do |place|
      player.board.player_ships.valid_positions.include?(place)
    end
  end

  def positions_not_adjacent?(locations)
    outcome = false
    if locations.size < 2
      outcome
    else
      index = 0
      while index < locations.size - 1
        unless all_adjacent_locations(locations[index]).include?(locations[index + 1])
          outcome = true
        end
        index += 1
      end
    end
    outcome
  end
  
  def already_guessed?(input, player)
    !player.board.player_hits_and_misses.valid_positions.include?(input)
  end
end
# require 'pry'; binding.pry