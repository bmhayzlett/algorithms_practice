require 'byebug'

class Board
  attr_accessor :grid, :rows, :columns, :squares
  # rows == y
  # columns == x

  def initialize(seeds)
    @grid = Array.new(9) { Array.new(9, nil) }
    @rows = {}
    @columns = {}
    @squares = {}
    1.upto(9) do |i|
      @rows[i] = Hash.new(false)
      @columns[i] = Hash.new(false)
      @squares[i] = Hash.new(false)
    end
    seed_board(seeds)
  end

  def [](pos)
    y,x = pos
    @grid[y - 1][x - 1]
  end

  def []=(pos,num)
    y,x = pos
    add_to_row_col!(y,x,num)
    add_to_sq!(y,x,num)
    row = y - 1
    col = x - 1
    @grid[row][col] = num
  end

  def seed_board(seeds)
    seeds.each do |triple|
      y,x = triple[0], triple[1]
      num = triple[2]
      self[[x,y]] = num
    end
  end


  def add_to_row_col!(row,col,num)
    @rows[row][num] = true
    @columns[col][num] = true
  end

  def add_to_sq!(row,col,num)
    if row <= 3
      y_idx = 0
    elsif row >=4 && row <= 6
      y_idx = 3
    elsif row >=7
      y_idx = 6
    end

    if col <= 3
      x_idx = 1
    elsif col >= 4 && col <= 6
      x_idx = 2
    elsif col >=7
      x_idx = 3
    end

    sq_num = y_idx + x_idx
    @squares[sq_num][num] = true
  end

end
