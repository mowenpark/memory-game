require_relative "board.rb"
require_relative "card.rb"
require_relative 'player.rb'

class Game
  attr_accessor :board, :player

  def initialize(player = HumanPlayer.new("Johnny"), human = true)
    @board = Board.new
    if human == true
      @player = player
    else
      @player = ComputerPlayer.new
    end
    @board.populate
    @previous_guess = nil
  end

  def play
    until over?
      @board.render
      puts "Please choose a card's position on the board (e.g. x,y)."
      guess1 = make_guess
      board_state(guess1)
      puts "Great! now guess its match!"
      guess2 = make_guess
      board_state(guess2)
      round_end(guess1, guess2)
    end

    puts "Congrats! You won the game! :)"
  end

  def over?
    @board.won?
  end

  def match?(guess1, guess2)
    @board[guess1].value == @board[guess2].value
  end

  def board_state(guess)
    @board.reveal(guess)
    @board.render
  end

  def round_end(guess1,guess2)
    unless match?(guess1,guess2)
      @board[guess1].hide
      @board[guess2].hide
      puts "You guessed wrong."
    else
      puts "It's a match!"
    end

  end

  def make_guess # want to return a valid position
    pos = @player.get_input.split(",").map(&:to_i)
    until guess_valid?(pos)
      puts "Not a valid guess! Try again you idiot."
      pos = @player.get_input.split(",").map(&:to_i)
    end

    pos
  end

  def guess_valid?(pos) # want to return true if pos is valid
    # debugger
    return false if @board[pos].nil? || @board[pos].revealed

    true
  end

end
