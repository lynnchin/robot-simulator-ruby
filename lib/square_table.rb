class SquareTable
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
  end

  def check_position(x_coordinate, y_coordinate)
    if (x_coordinate < 0 or x_coordinate > rows) or
        (y_coordinate < 0 or y_coordinate > columns)
      false
    else
      true
    end
  end

  attr_accessor :rows, :columns
end
