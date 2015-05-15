require File.expand_path('rover', __dir__)

class Plateau

  attr_reader :end_x, :end_y, :start_x, :start_y
  def initialize(end_x, end_y, start_x = 0, start_y = 0)
    @end_x   = end_x.to_i
    @end_y   = end_y.to_i
    @start_x = start_x
    @start_y = start_y
  end

  def rovers
    @rovers ||= []
  end

  def move_rovers
    rovers.map(&:move)
  end

  def add_rover(*attributes)
    rovers.push(Rover.new(*attributes, self))
  end

  def attainable_position?(position)
    position.x >= start_x and
    position.x <= end_x and
    position.y >= start_y and
    position.y <= end_y
  end
end
