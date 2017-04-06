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
end