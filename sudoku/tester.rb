require_relative './board.rb'
require_relative './game.rb'

def test_easy_board
  seeds = [[1,1,5], [3,1,8], [5,1,7], [6,1,3], [7,1,1], [8,1,9],
           [1,2,9], [4,2,6], [7,2,4], [9,2,8]]
  return Board.new(seeds)
end

def test_medium_board
end

def test_hard_board
end
