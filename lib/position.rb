class Position
  def initialize(x = 0, y = 0)
    @x_coordinate = x
    @y_coordinate = y
  end

  def display
    @x_coordinate.to_s + ',' + @y_coordinate.to_s
  end

  def update(x, y)
    @x_coordinate += x
    @y_coordinate += y
  end

  attr_accessor :x_coordinate, :y_coordinate
end
