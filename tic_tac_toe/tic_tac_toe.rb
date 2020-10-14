class Player
  attr_reader :name, :symbol
  attr_accessor :current
  
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @current = nil
  end

  def is_first
    if @current == true
      puts "#{self.name}, you're up first."
    end
  end
end

class Begin
  def coin_flip
    toss = rand(2)
    if toss == 1
      puts "It landed HEADS UP!"
      return true
    else
      puts "It landed TAILS UP!"
      return false
    end
  end
end
  
class Board
  attr_accessor :cells
  @cells = []
  
  def initialize
    @cells = [[" "," "," "],[" "," "," "],[" "," "," "]]
  end

  def display_board
    system "clear"
    puts " __  __|  _)    __ __|          __ __|            "
    puts "    |    |   __|  |   _` |   __|  |   _ \\   _ \\ "
    puts "    |    |  (     |  (   |  (     |  (  |   __/ "
    puts "   _|   _| \\___| _| \\__,_| \\___| _| \\___/ \\___| "
    puts ""
    puts "  |‾‾‾‾‾|‾‾‾‾‾|‾‾‾‾‾|"
    puts "  |  #{@cells[0][0]}  |  #{@cells[0][1]}  |  #{@cells[0][2]}  |"
    puts "  |7____|8____|9____|"
    puts "  |     |     |     |"
    puts "  |  #{@cells[1][0]}  |  #{@cells[1][1]}  |  #{@cells[1][2]}  |"
    puts "  |4____|5____|6____|"
    puts "  |     |     |     |"
    puts "  |  #{@cells[2][0]}  |  #{@cells[2][1]}  |  #{@cells[2][2]}  |"
    puts "  |1____|2____|3____|"
    puts ""
  end

  def chosen_cell_play
    case $chosen_cell 
    when 1
      if @cells[2][0] == " "
        @cells[2][0] = "#{$current_player.symbol}"
      else
        return 0
      end 
    when 2
      if @cells[2][1] == " "
        @cells[2][1] = "#{$current_player.symbol}"
      else
        return 0
      end
    when 3
      if @cells[2][2] == " "
        @cells[2][2] = "#{$current_player.symbol}"
      else
        return 0
      end
    when 4
      if @cells[1][0] == " "
        @cells[1][0] = "#{$current_player.symbol}"
      else
        return 0
      end
    when 5
      if @cells[1][1] == " "
        @cells[1][1] = "#{$current_player.symbol}"
      else
        return 0
      end
    when 6
      if @cells[1][2] == " "
        @cells[1][2] = "#{$current_player.symbol}"
      else
        return 0
      end
    when 7
      if @cells[0][0] == " "
        @cells[0][0] = "#{$current_player.symbol}"
      else
        return 0
      end
    when 8
      if @cells[0][1] == " "
        @cells[0][1] = "#{$current_player.symbol}"
      else
        return 0
      end
    when 9
      if @cells[0][2] == " "
        @cells[0][2] = "#{$current_player.symbol}"
      else
        return 0
      end
    end
  end
end

class Game
  attr_reader :active_board

  def initialize
    @active_board = Board.new
  end

  def game_setup
    system "clear"
    puts " __  __|  _)    __ __|          __ __|            "
    puts "    |    |   __|  |   _` |   __|  |   _ \\   _ \\ "
    puts "    |    |  (     |  (   |  (     |  (  |   __/ "
    puts "   _|   _| \\___| _| \\__,_| \\___| _| \\___/ \\___| "
    puts "", "Welcome to Tic Tac Toe, the world's best game."
    puts "Player 1, what is your name?"
    $player1 = Player.new(gets.chomp, "X")
    puts ""
    puts "Hello, #{$player1.name}, your symbol is '#{$player1.symbol}'.", ""
    puts "Player 2, what is your name?"
    $player2 = Player.new(gets.chomp, "O")
    puts ""
    puts "Great! #{$player2.name}, your symbol is '#{$player2.symbol}'.", ""
    puts "Let's flip a coin to see who goes first."
    puts "#{$player1.name}, you're heads. #{$player2.name}, you're tails."
    puts "Hit RETURN to flip it"
    gets
    puts "FLIP!", ""
    sleep(1.5)
    coin = Begin.new
    $player1.current = coin.coin_flip
    $player2.current = !$player1.current
    $player1.is_first
    $player2.is_first
    gets
  end

  def play_game
    i = 0
    while i < 9 do
      active_board.display_board
      current_player_check
      puts "#{$current_player.name}, choose a cell to play."
      $chosen_cell = gets.chomp.to_i
      unless (1..9).include?($chosen_cell) 
        puts "You must choose an open cell, using 1 - 9"
        sleep(0.7)
        redo 
      end
      if active_board.chosen_cell_play == 0
        puts "You must choose an empty cell"
        sleep(0.7)
        redo
      end
      active_board.chosen_cell_play
      $player1.current = !$player1.current
      $player2.current = !$player2.current
      break if self.check_game_over == 0
      i += 1
    end
    active_board.display_board
    puts "The game has ended in a tie!" if i == 9
  end

  def current_player_check
    if $player1.current == true
      $current_player = $player1
    else
      $current_player = $player2
    end
  end

  def check_game_over
    if (active_board.cells[0].uniq.count == 1) && (active_board.cells[0][0] != " ")
      active_board.display_board
      finish_game
    elsif (active_board.cells[1].uniq.count == 1) && (active_board.cells[1][0] != " ")
      active_board.display_board
      finish_game
    elsif (active_board.cells[2].uniq.count == 1) && (active_board.cells[2][0] != " ")
      active_board.display_board
      finish_game
    elsif (active_board.cells.transpose[0].uniq.count == 1) && (active_board.cells.transpose[0][0] != " ")
      active_board.display_board
      finish_game
    elsif (active_board.cells.transpose[1].uniq.count == 1) && (active_board.cells.transpose[1][0] != " ")
      active_board.display_board
      finish_game
    elsif (active_board.cells.transpose[2].uniq.count == 1) && (active_board.cells.transpose[2][0] != " ")
      active_board.display_board
      finish_game
    elsif (active_board.cells[0][0] == active_board.cells[1][1]) && (active_board.cells[1][1] == active_board.cells[2][2]) && (active_board.cells[1][1] != " ")
      active_board.display_board
      finish_game
    elsif (active_board.cells[0][2] == active_board.cells[1][1]) && (active_board.cells[1][1] == active_board.cells[2][0]) && (active_board.cells[1][1] != " ")
      active_board.display_board
      finish_game
    end
  end
  
  def finish_game
    puts "GAME OVER! #{$current_player.name} wins!"
    puts "Thanks for playing."
    gets
    return 0
  end

end


play = Game.new
play.game_setup
play.play_game