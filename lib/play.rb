# frozen_string_literal: true

require './lib/board'

# Logic for playing the game
class Play
  def initialize
    @board = Board.new
  end

  def welcome_message
    puts 'Welcome to Connect Four!'
    puts 'Player 1, you have token X'
    puts 'Player 2, you have token O'
  end

  def play
    welcome_message
    untill @board.won?('|X|') || @board.won?('|O|')
  end
end