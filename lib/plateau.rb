require File.expand_path('rover', __dir__)

class Plateau

  attr_reader :width, :height
  def initialize(width, height)
    @width  = width.to_i
    @height = height.to_i
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
    position.x >= 0 and position.x <= width and
    position.y >= 0 and position.y <= height
  end
end
