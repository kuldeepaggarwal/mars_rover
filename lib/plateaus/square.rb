class SquarePlateau < Plateau
  attr_reader :end_x, :end_y, :start_x, :start_y
  def initialize(start_x, start_y, length)
    length   = length.to_i
    @start_x = start_x.to_i
    @start_y = start_y.to_i
    @end_x   = @start_x + length
    @end_y   = @start_y + length
  end

  def attainable_position?(position)
    position.x >= start_x and
    position.x <= end_x and
    position.y >= start_y and
    position.y <= end_y
  end
end
