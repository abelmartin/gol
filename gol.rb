require 'pry'

class Game
  attr_reader :board
  def initialize(board)
    @board = board
  end

  def evolve
    new_board = Array.new(board.length)
    new_board.each_with_index do |_, index|
      new_board[index] = Array.new(board.length)
    end

    board.each_with_index do |row, rindex|
      row.each_with_index do |cell, cindex|
        livers = neighbor_count(rindex, cindex)
        if board[rindex][cindex] == 1
          new_board[rindex][cindex] = (livers == 2 || livers == 3) ? 1:0
        else
          new_board[rindex][cindex] = 0
        end
      end
    end

    new_board
  end

  private

  def neighbor_count(rindex, cindex)
    living_neighbors = 0

    # binding.pry if rindex == 0
    # Top
    if rindex-1 >= 0
      living_neighbors += 1 if cindex-1 >= 0 && board[rindex-1][cindex-1] == 1
      living_neighbors += 1 if board[rindex-1][cindex] == 1
      living_neighbors += 1 if cindex+1 < board.length && board[rindex-1][cindex+1] == 1
    end

    # Bottom
    if rindex+1 < board.length
      living_neighbors += 1 if cindex-1 >= 0 && board[rindex+1][cindex-1] == 1
      living_neighbors += 1 if board[rindex+1][cindex] == 1
      living_neighbors += 1 if cindex+1 < board.length && board[rindex+1][cindex+1] == 1
    end

    # Sides
    living_neighbors += 1 if cindex-1 >= 0 && board[rindex][cindex-1] == 1
    living_neighbors += 1 if cindex+1 < board.length && board[rindex][cindex+1] == 1

    # puts "#{[rindex, cindex]}: #{living_neighbors}"
    living_neighbors
  end
end