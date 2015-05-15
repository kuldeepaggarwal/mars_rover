Point = Struct.new(:x, :y) do
  def move_by(other)
    Point.new(x + other.x, y + other.y)
  end
end
