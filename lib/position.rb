class Position
  def initialize(x = 0, y = 0)
    @x_coordinate = x
    @y_coordinate = y
  end

  def display
    @x_coordinate.to_s + ',' + @y_coordinate.to_s
  end

  def update(x, y)
    @x_coordinate = x
    @y_coordinate = y
  end

  def validate_coordinates(x_value, y_value, max_table_size)
    validate(x_value, 'X', max_table_size)
    validate(y_value, 'Y', max_table_size)
  end

  def validate(value, _axis, max_table_size)
    valid = true
    valid = false unless value.to_i.between?(0, max_table_size)
    fail '#{axis}-coordinate value must fall between
      range of 0 to #{max_table_size.to_s}' unless valid
  end

  attr_reader :x_coordinate, :y_coordinate
end
