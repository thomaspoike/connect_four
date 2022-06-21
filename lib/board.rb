# frozen_string_literal: true

# Logic for Connect four board game
class Board
  attr_reader :grid_width, :grid_height, :grid

  def initialize
    @grid_width = 7
    @grid_height = 6
    @grid = Array.new(grid_height) { Array.new(grid_width, '| |') }
  end

  # Places a token in the first empty space in the column
  def place_token(column, token)
    row = check_column(column)
    return nil if row.nil?

    @grid[row][column] = token
  end

  # Returns the index of the first empty space in the column
  def check_column(column)
    @grid.each_with_index do |row, index|
      return index if row[column] == '| |'
    end
    nil
  end

  # Prints the board
  def print_grid
    @grid.reverse_each do |row|
      puts row.join('')
    end
    p '________________'
    @grid.each do |row|
      puts row.join('')
    end
  end

  # Checks vertical win
  def check_vertical(token, row, column)
    count = 0
    (0..3).each do |i|
      if @grid[row + i][column] == token
        count += 1
      else
        return false
      end
    end
    return true if count == 4

    false
  end

  # Checks horizontal win
  def check_horizontal(token, row, column)
    count = 0
    (0..3).each do |i|
      if @grid[row][column + i] == token
        count += 1
      else
        return false
      end
    end
    return true if count == 4

    false
  end


  # Check diagonal right win
  def check_diagonal_right(token, row, column)
    count = 0
    (0..3).each do |i|
      if @grid[row + i][column + i] == token
        count += 1
      else
        return false
      end
    end
    return true if count == 4

    false
  end

  # Check diagonal left win
  def check_diagonal_left(token, row, column)
    count = 0
    (0..3).each do |i|
      if @grid[row + i][3 + column - i] == token
        count += 1
      else
        return false
      end
    end
    return true if count == 4

    false
  end

  # Checks diagonal win
  def check_diagonal(token, row, column)
    (0..2).each do |j|
      (0..3).each do |i|
        return true if check_diagonal_right(token, row + j, column + i)
        return true if check_diagonal_left(token, row + j, column + i)
      end
    end
  end
  

  # Any winner?
  def won?(token)

    
  end

end

board = Board.new

board.place_token(0, '|X|')
board.place_token(0, '|X|')
board.print_grid

=begin
    if column_full?(column)
      raise 'Column is full'
    else
      @grid[column][get_next_empty_row(column)] = token
    end
  end

  def column_full?(column)
    @grid[column].none? { |cell| cell == ' ' }
  end

  def get_next_empty_row(column)
    @grid[column].index(' ')
  end
rescue => exception
  

=end