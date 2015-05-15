class NASASignal
  def new_direction(_)
    raise 'Not Implemented'
  end

  def self.parse(input_string)
    input_string.chomp.split('').map! do |_signal|
      Object.const_get("#{ _signal }Signal").new
    end
  end
end

class LSignal < NASASignal
  def move_position(position)
    Position.new(position.x, position.y, position.direction.left.type)
  end
end

class RSignal < NASASignal
  def move_position(position)
    Position.new(position.x, position.y, position.direction.right.type)
  end
end

class MSignal < NASASignal
  def move_position(position)
    direction = position.direction
    new_cordinates = direction.move_forward
    Position.new(new_cordinates.x, new_cordinates.y, direction.type)
  end
end
