require_relative '../lib/robot'
require_relative '../lib/square_table'
require_relative '../lib/position'

class Simulator
  attr_accessor :table, :robots, :current_robot_index

  def initialize(width = 5, height = 5)
    @table = SquareTable.new(width, height)
    @robots = []
  end

  def execute(line, robot_index=0)
    return nil if line.strip.empty?
    tokens = line.split(/\s+/)
    operator = tokens.first
    arguments = tokens.last
    @current_robot_index = robot_index
    if @robots.empty? && @robots.size == robot_index
    @robots << Robot.new
    end
    execute_command(operator, arguments)
  end

  def execute_command(operator, arguments)
    case operator
    when 'PLACE'
      place(arguments)
    when 'REPORT'
      report
    when 'MOVE'
      move
    when 'LEFT'
      left
    when 'RIGHT'
      right
    else
      'Invalid command line agrument #{command}'
    end
  end

  def place(arguments)
    tokens = arguments.split(/,/)
    x = tokens[0].to_i
    y = tokens[1].to_i
    orientation = tokens[2].downcase.to_sym
    place_robot(x, y, orientation)
    nil
  end

  def report
    @table.position_to_s + ',' + current_robot.to_s unless @table.position.nil? && current_robot.orientation.nil?
  end

  def left
    return nil unless @table.placed?
    current_robot.left
  end

  def right
    return nil unless @table.placed?
    current_robot.right
  end

  def move
    fail 'Robot not found' if current_robot.nil?

    case current_robot.orientation
    when :north
      move_position(0, 1, @table)
    when :south
      move_position(0, -1, @table)
    when :east
      move_position(1, 0, @table)
    when :west
      move_position(-1, 0, @table)
    else
      fail 'No such move. Invalid orientation'
    end
    nil
  end

  def current_robot
    @robots.first
  end

  private

  def move_position(x_value, y_value, table)
    new_position = Position.new(x_value, y_value)
    fail 'Invalid move in position. #' unless table.valid_change_in_position new_position
    table.update(new_position)
  end

  def place_robot(x_coordinate, y_coordinate, orientation)
    @table.place Position.new(x_coordinate, y_coordinate)
    fail 'Fail to place robot. Invalid position.' unless @table.placed?
    current_robot.update_direction orientation
  end
end
