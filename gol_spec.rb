# require 'rspec'
load 'gol.rb'

describe Game do
  describe 'first rule' do
    it 'kills a cell with 0 neighbors' do
      board = [
        [0,1,0],
        [0,0,0],
        [0,0,0],
      ]

      game = Game.new(board)

      expect(game.evolve).to eq([
        [0,0,0],
        [0,0,0],
        [0,0,0]
      ])
    end

    it 'kills a cell with only 1 neighbor' do
      board = [
        [0,1,0],
        [0,1,0],
        [0,0,0],
      ]

      game = Game.new(board)

      expect(game.evolve).to eq([
        [0,0,0],
        [0,0,0],
        [0,0,0]
      ])
    end
  end

  describe 'second rule' do
    it 'keeps a cell with 2 neighbors alive' do
      board = [
        [0,0,1],
        [0,0,1],
        [0,0,1],
      ]

      game = Game.new(board)

      expect(game.evolve).to eq([
        [0,0,0],
        [0,0,1],
        [0,0,0]
      ])
    end

    it 'keeps a cell with 3 neighbors alive' do
      board = [
        [1,1,1],
        [0,1,0],
        [0,0,0],
      ]

      game = Game.new(board)

      expect(game.evolve).to eq([
        [1,1,1],
        [0,1,0],
        [0,0,0]
      ])
    end
  end

  describe 'third rule' do
    it 'kills a cell with 3 neighbors alive' do
      board = [
        [1,1,1],
        [1,1,1],
        [1,1,1],
      ]

      game = Game.new(board)

      expect(game.evolve).to eq([
        [1,0,1],
        [0,0,0],
        [1,0,1]
      ])
    end
  end
end