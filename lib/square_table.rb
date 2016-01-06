class SquareTable
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
  end

  def check_position(x_coordinate, y_coordinate)
    if (x_coordinate < 0 || x_coordinate > rows) ||
        (y_coordinate < 0 || y_coordinate > columns)
      false
    else
      true
    end
  end

  attr_accessor :rows, :columns
end
