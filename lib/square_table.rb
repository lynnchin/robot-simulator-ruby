class SquareTable
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @position = nil
  end

  def place(x_coordinate,y_coordinate)
    @position = Position.new(x_coordinate,y_coordinate) if valid_position(x_coordinate,y_coordinate)
  end

  def placed?
    @position.nil? ? false : true
  end

  def valid_position(x_coordinate,y_coordinate)
    if (x_coordinate < 0 || x_coordinate > rows) ||
        (y_coordinate < 0 || y_coordinate > columns)
      false
    else
      true
    end
  end

  def position_to_s
    @position.to_s
  end

  attr_reader :rows, :columns, :position
end
