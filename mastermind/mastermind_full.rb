module GeneralPlayerCode
  attr_accessor :board, :guess, :feedback_array, :possible_codes
  SECRET_CODE = Array.new(4) {rand(6) + 1}

  def initialize
    @board = Board.new
    puts "[CREATING]"
    sleep(0.7)
    puts "[SECRET]"
    sleep(0.7)
    puts "[CODE]"
    sleep(0.7)
    @guess = 0
    @feedback_array = []
    self.play
  end

  def game_win
    board.code_hide = "              --> " + SECRET_CODE.join(' ') + " <--"
    board.display
    puts "CONGRATS YOU HAVE WON THE GAME"
  end
 
  def secret_code_printer
    return SECRET_CODE.join.split(//)
  end

  def check_guess
    perfect = 0
    nearly_right = 0
    secret_code_analyzed = self.secret_code_printer
    i = 0
    guess_check = @guess.join.split(//)
    while i < 4
      if guess_check[i] == secret_code_analyzed[i]
        perfect += 1
        secret_code_analyzed[i] = nil
        guess_check[i] = 'x'
      end
      i += 1
    end
    i = 0
    while i < 4
      if guess_check[i] == secret_code_analyzed[0] 
        nearly_right += 1
        secret_code_analyzed[0] = nil
        i += 1
      elsif guess_check[i] == secret_code_analyzed[1] 
        nearly_right += 1
        secret_code_analyzed[1] = nil
        i += 1
      elsif guess_check[i] == secret_code_analyzed[2] 
        nearly_right += 1
        secret_code_analyzed[2] = nil
        i += 1
      elsif guess_check[i] == secret_code_analyzed[3] 
        nearly_right += 1
        secret_code_analyzed[3] = nil
        i += 1
      else
        i += 1
      end
    end
    return [perfect, nearly_right]
  end
end

class Intro
  def initialize
    system "clear"
    puts "Welcome to MasterMind", ""
    puts "The computer will create a four-digit secret code, using numbers 1 - 6."
    puts "Your job is to decode it within 12 guesses."
    puts "With each guess, you will receive simple feedback:"
    puts "  each '•' means you have a correct number in it's correct position"
    puts "  each '*' means you have a correct number, but it's in the wrong position"
    puts "Symbol positions on the feedback line do NOT correspond to a position in your guess."
    puts "Numbers in the secret code CAN repeat"
    puts "", "Would you like to give it a go?"
    puts "Type 'yes' to do it yourself, or type 'no' to watch the computer play."
    self.game_type
  end

  def game_type
    human_player = gets.chomp
    if human_player == "yes"
      play = HumanPlayer.new
    elsif human_player == "no"
      play = ComputerPlayer.new
    else
      puts "Please type 'yes' or 'no'"
      self.game_type
    end
  end
end

class Board
  attr_accessor :guesses, :code_hide
  def initialize
    @guesses = {1 => ["-", "-","-", "-",["-", "-", "-", "-"]],
      2 => ["-", "-", "-", "-", ["-", "-", "-", "-"]],
      3 => ["-", "-", "-", "-", ["-", "-", "-", "-"]],
      4 => ["-", "-", "-", "-", ["-", "-", "-", "-"]],
      5 => ["-", "-", "-", "-", ["-", "-", "-", "-"]],
      6 => ["-", "-", "-", "-", ["-", "-", "-", "-"]],
      7 => ["-", "-", "-", "-", ["-", "-", "-", "-"]],
      8 => ["-", "-", "-", "-", ["-", "-", "-", "-"]],
      9 => ["-", "-", "-", "-", ["-", "-", "-", "-"]],
      10 => ["-", "-", "-", "-", ["-", "-", "-", "-"]],
      11 => ["-", "-", "-", "-", ["-", "-", "-", "-"]],
      12 => ["-", "-", "-", "-", ["-", "-", "-", "-"]] }
    @code_hide = "                SECRET CODE"
  end
  
  def display
    system "clear"
    puts "   _____         _           _____ _       _ "
    puts "  |     |___ ___| |_ ___ ___|     |_|___ _| |"
    puts "  | | | | .'|_ -|  _| -_|  _| | | | |   | . |"
    puts "  |_|_|_|__,|___|_| |___|_| |_|_|_|_|_|_|___|"
    puts ""  
    puts code_hide
    puts ""
    puts "           12  |  " + @guesses[12][0..3].join(' ') + "  |  |" + @guesses[12][4].join('') + "|"
    puts "           11  |  " + @guesses[11][0..3].join(' ') + "  |  |" + @guesses[11][4].join('') + "|"
    puts "           10  |  " + @guesses[10][0..3].join(' ') + "  |  |" + @guesses[10][4].join('') + "|F"
    puts "            9  |  " + @guesses[9][0..3].join(' ') + "  |  |" + @guesses[9][4].join('') + "|E"
    puts "            8  |  " + @guesses[8][0..3].join(' ') + "  |  |" + @guesses[8][4].join('') + "|E"
    puts "            7  |  " + @guesses[7][0..3].join(' ') + "  |  |" + @guesses[7][4].join('') + "|D"
    puts "            6  |  " + @guesses[6][0..3].join(' ') + "  |  |" + @guesses[6][4].join('') + "|B"
    puts "            5  |  " + @guesses[5][0..3].join(' ') + "  |  |" + @guesses[5][4].join('') + "|A"
    puts "            4  |  " + @guesses[4][0..3].join(' ') + "  |  |" + @guesses[4][4].join('') + "|C"
    puts "            3  |  " + @guesses[3][0..3].join(' ') + "  |  |" + @guesses[3][4].join('') + "|K        Choose four numbers, 1 - 6"
    puts "            2  |  " + @guesses[2][0..3].join(' ') + "  |  |" + @guesses[2][4].join('') + "|     • = 100% correct"
    puts "            1  |  " + @guesses[1][0..3].join(' ') + "  |  |" + @guesses[1][4].join('') + "|     * = right number, wrong space"
    puts ""
  end
end

class HumanPlayer
  include GeneralPlayerCode

  def play
    i = 1
    while i <= 12
      board.display
      puts "Guess ##{i}:"
      @guess = gets.chomp.split(//)
      board.guesses[i][0] = @guess[0]
      board.guesses[i][1] = @guess[1]
      board.guesses[i][2] = @guess[2]
      board.guesses[i][3] = @guess[3]
      feedback_array = self.check_guess
      board.guesses[i][4] = (("•" * feedback_array[0]) + ("*" * feedback_array[1]) + ("-" * (4 - feedback_array.reduce { |a, b| a + b}))).split(//)
      if feedback_array[0] == 4
        self.game_win
        break
      end
      i += 1
    end
    if i == 13
      board.code_hide = "              --> " + SECRET_CODE.join(' ') + " <--"
      board.display
      puts "Sorry, you have lost the game!"
    end
  end
end

class ComputerPlayer 
  include GeneralPlayerCode
  
  def compute_possibles
    @possible_codes = []
    code_range = (1111..6666).to_a
    code_range.each do |number|
      if number.to_s.split(//).include? ("7")
        next
      elsif number.to_s.split(//).include? ("8")
        next
      elsif number.to_s.split(//).include? ("9")
        next
      elsif number.to_s.split(//).include? ("0")
        next
      else possible_codes.push(number)
      end
    end
  end

  def play
    self.compute_possibles
    i = 1
    while i <= 12
      board.display
      sleep(0.7)
      @guess = self.get_guess
      board.guesses[i][0] = @guess[0]
      board.guesses[i][1] = @guess[1]
      board.guesses[i][2] = @guess[2]
      board.guesses[i][3] = @guess[3]
      @feedback_array = self.check_guess
      if feedback_array[0] == 4
        board.guesses[i][4] = "••••".split(//)
        self.game_win
        break
      end
      board.guesses[i][4] = (("•" * feedback_array[0]) + ("*" * feedback_array[1]) + ("-" * (4 - feedback_array.reduce { |a, b| a + b}))).split(//)
      possible_codes.shift
      i +=1
    end
  end

  def get_guess
    if possible_codes.length == 1296
      possible_codes[0].to_s.split(//)
    else
      self.eliminate_possibles
      possible_codes[0].to_s.split(//)
    end
  end

  def eliminate_possibles
    compare_array = []
    code_to_eliminate = []
    possible_codes.each_with_index do |code, index|
      code_analyzed = code.to_s.split(//)
      perfect = 0
      nearly_right = 0
      i = 0
      while i < 4
        guess_compared = @guess.join.split(//)    
        if code_analyzed[i] == guess_compared[i]
          perfect += 1
          guess_compared[i] = nil
          code_analyzed[i] = 'x'
        end
        i += 1
      end

      i = 0
      while i < 4
        if code_analyzed[i] == guess_compared[0] 
          nearly_right += 1
          guess_compared[0] = nil
          i += 1
        elsif code_analyzed[i] == guess_compared[1] 
          nearly_right += 1
          guess_compared[1] = nil
          i += 1
        elsif code_analyzed[i] == guess_compared[2] 
          nearly_right += 1
          guess_compared[2] = nil
          i += 1
        elsif code_analyzed[i] == guess_compared[3] 
          nearly_right += 1
          guess_compared[3] = nil
          i += 1
        else
          i += 1
        end
        compare_array = [perfect, nearly_right]
      end
      if feedback_array != compare_array
        code_to_eliminate.push(index)
      end
    end
    code_to_eliminate.reverse.each do |del|
      possible_codes.delete_at(del)
    end
    
  end
end

start = Intro.new