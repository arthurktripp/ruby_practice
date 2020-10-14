class Player
  attr_reader :name, :symbol, :first
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @first = nil
  end
end


class Board
  attr_accessor :cells
  def initialize
    @@cells = [[" "," "," "],[" "," "," "],[" "," "," "]]
  end

  def display
    system "clear"
    puts "|‾‾‾‾‾|‾‾‾‾‾|‾‾‾‾‾|"
    puts "|  #{@@cells[0][0]}  |  #{@@cells[0][1]}  |  #{@@cells[0][2]}  |"
    puts "|_____|_____|_____|"
    puts "|     |     |     |"
    puts "|  #{@@cells[1][0]}  |  #{@@cells[1][1]}  |  #{@@cells[1][2]}  |"
    puts "|_____|_____|_____|"
    puts "|     |     |     |"
    puts "|  #{@@cells[2][0]}  |  #{@@cells[2][1]}  |  #{@@cells[2][2]}  |"
    puts "|_____|_____|_____|"
  end
end



    
    
    
    
    
    
    
    
    