require File.expand_path('point', __dir__)

Direction = Struct.new(:current_position) do
  DIRECTIONS = {
    'N' => 'NorthDirection',
    'S' => 'SouthDirection',
    'E' => 'EastDirection',
    'W' => 'WestDirection'
  }

  INVERT_DIRECTIONS = DIRECTIONS.invert

  def move_forward
    current_position.move_by(movement_vector)
  end

  def movement_vector
    raise 'Not Implemented'
  end

  def left
    raise 'Not Implemented'
  end

  def right
    raise 'Not Implemented'
  end

  def type
    INVERT_DIRECTIONS.fetch(self.class.name)
  end

  alias_method :to_s, :type
  alias_method :inspect, :type

  def self.find(direction_string)
    Object.const_get(DIRECTIONS.fetch(direction_string) { raise 'INVALID Direction' })
  end
end

class NorthDirection < Direction
  def movement_vector
    Point.new(0, 1)
  end

  def left
    WestDirection.new(current_position)
  end

  def right
    EastDirection.new(current_position)
  end
end

class SouthDirection < Direction
  def movement_vector
    Point.new(0, -1)
  end

  def left
    EastDirection.new(current_position)
  end

  def right
    WestDirection.new(current_position)
  end
end

class EastDirection < Direction
  def movement_vector
    Point.new(1, 0)
  end

  def left
    NorthDirection.new(current_position)
  end

  def right
    SouthDirection.new(current_position)
  end
end

class WestDirection < Direction
  def movement_vector
    Point.new(-1, 0)
  end

  def left
    SouthDirection.new(current_position)
  end

  def right
    NorthDirection.new(current_position)
  end
end
