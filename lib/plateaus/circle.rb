class CirclePlateau < Plateau
  attr_reader :centre_x, :centre_y, :radius
  def initialize(centre_x, centre_y, radius)
    @centre_y = centre_y.to_i
    @centre_x = centre_x.to_i
    @radius   = radius.to_i
  end

  def attainable_position?(position)
    (position.x - centre_x) ** 2 + (position.y - centre_y) ** 2 <= radius ** 2
  end
end
