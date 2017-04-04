require 'pry'
class Board
  
  attr_accessor :valid_positions, :board

  def initialize
    @valid_positions = ['A1', 'A2', 'A3', 'A4', 
                        'B1', 'B2', 'B3', 'B4',
                        'C1', 'C2', 'C3', 'C4',
                        'D1', 'D2', 'D3', 'D4']
    @board = full_board         
  end

  def header_and_footer
    ['===========']
  end

  def column_label
    ['. ','1 ','2 ','3 ','4 ']
  end

  def row(letter)
    [letter, ' ', ' ', ' ', ' ' ]
  end

  def full_board
    [header_and_footer,
    column_label,
      row('A'),
      row('B'),
      row('C'),
      row('D'),
      header_and_footer]
    
  end

  def print_board
    full_board.each do |row|
      puts "#{row.join} \n"
    end  
  end
end

# b = Board.new
# b.print_board