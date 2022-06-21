# frozen_string_literal: true

require './lib/board'

describe Board do

  describe '#initilize' do
    let(:board) { described_class.new }

    it 'Board grid width equal 7 ' do
      grid_width = board.grid_width
      expect(grid_width).to eq(7)
    end

    it 'Board grid height equal 6 ' do
      grid_height = board.grid_height
      expect(grid_height).to eq(6)
    end

    it 'Board grid is an array of arrays ' do
      grid_array = board.grid
      expect(grid_array).to be_an(Array)
      expect(grid_array[0]).to be_an(Array)
    end
  end

  describe '#place_token' do
    let(:board) { described_class.new }

    it 'Placing a token in the first column' do
      board.place_token(0, 'X')
      expect(board.grid[0][0]).to eq('X')
    end

    it 'Returns nil if column is full' do
      6.times { board.place_token(0, 'X') }
      expect(board.place_token(0, 'X')).to be_nil
    end
  end

  describe '#check_column' do
    let(:board) { described_class.new }
    it 'First empty in column 1 should be 1, after placing a token' do
      board.place_token(0, 'X')
      index = board.check_column(0)
      expect(index).to eq(1)
    end

    it 'First empty in column 2 should be 0' do
      index = board.check_column(1)
      expect(index).to eq(0)
    end

    it 'Returns nil if column is full' do
      6.times { board.place_token(0, 'X') }
      index = board.check_column(0)
      expect(index).to be_nil
    end
  end
end
