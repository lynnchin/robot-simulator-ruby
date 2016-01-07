class Robot
  attr_reader :directions, :orientation

  def initialize
    @orientation = nil
    @directions = [:north, :east, :south, :west]
  end

  def left
    if @orientation.nil?
      fail 'Unknown orientation'
    else
      @orientation = @directions[(@directions.index(@orientation) - 1) % @directions.length]
    end
  end

  def right
    if @orientation.nil?
      fail 'Unknown orientation'
    else
      @orientation = @directions[(@directions.index(@orientation) + 1) % @directions.length]
    end
  end

  def update_direction(new_orientation)
    if @directions.include?(new_orientation)
      @orientation = new_orientation
    else
      fail 'Invalid orientation #{new_orientation}'
    end
    nil
  end

  def to_s
    @orientation.to_s.upcase
  end
end
