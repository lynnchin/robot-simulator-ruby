class SquareTable
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @position = nil
  end

  def place(position)
    @position = position if valid_position(position)
  end

  def placed?
    @position.nil? ? false : true
  end

  def valid_position(position)
    if (position.x_coordinate < 0 || position.x_coordinate > rows) ||
        (position.y_coordinate < 0 || position.y_coordinate > columns)
      false
    else
      true
    end
  end

  def valid_change_in_position (change_position)
    new_position = Position.new change_position.x_coordinate+@position.x_coordinate, change_position.y_coordinate+@position.y_coordinate
    valid_position new_position
  end

  def position_to_s
    @position.to_s
  end

  def update(position)
    @position.update(position.x_coordinate, position.y_coordinate) if valid_position(position)
  end

  attr_reader :rows, :columns, :position
end
