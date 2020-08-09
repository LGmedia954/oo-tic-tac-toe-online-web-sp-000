class TicTacToe
  
   WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
  

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, token)
  @board[index] = token
end

def position_taken?(index)
  @board[index] != " "
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please choose a number 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    token = current_player
    move(index, token)
  else
    turn
  end
  display_board
end
 
def turn_count
  @board.count{|space| space != " "}
end

def current_player
  turn_count.even? ? "X" : "O"
end
 
def won?
  WIN_COMBINATIONS.any? do |combo|
    if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
      
      return combo
    end
  
end

def full?
  @board.all?{|space| space != " "}
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if combo = won?
  @board[combo[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play
  turn until over?
  puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
  
  

  
  
end