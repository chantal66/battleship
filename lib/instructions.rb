class Instructions
  
  def Welcome_message
    "Welcome to BATTLESHIP"
  end

  def menu_message
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions_message
    "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.

    Enter the squares for the two-unit ship:"
  end

  def placement_ship_intructions(size_ship)
    #"please enter the #{size_ship} ship"
  end

  def rules_violations(violations)
    "NO NO NO, please enter a valid size"
  end

  def attacking_prompt
    "Please enter the firing instructions: "
  end
end