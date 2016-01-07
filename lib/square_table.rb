class SquareTable
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @position = nil
  end

  def place(new_position)
    @position = new_position if valid_position(new_position)
  end

  def placed?
    @position.nil? ? false : true
  end

  def valid_position(new_position)
    if (new_position.x_coordinate < 0 || new_position.x_coordinate > rows) ||
        (new_position.y_coordinate < 0 || new_position.y_coordinate > columns)
      false
    else
      true
    end
  end

  attr_reader :rows, :columns, :position
end
