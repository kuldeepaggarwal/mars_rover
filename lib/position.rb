require File.expand_path('point', __dir__)
require File.expand_path('direction', __dir__)
require 'forwardable'

class Position
  extend Forwardable
  attr_accessor :coordinates, :direction

  def_delegators :coordinates, :x, :y, :move_by
  def initialize(x, y, direction_string)
    @coordinates = Point.new(x, y)
    @direction   = Direction.find(direction_string).new(self)
  end

  def move!(signal, plateau)
    new_position = signal.move_position(self)
    if plateau.attainable_position?(new_position)
      self.coordinates = new_position.coordinates
      self.direction  = new_position.direction
    end
    self
  end

  def self.parse(input)
    input.chomp!
    input = input.split(' ')
    new(input[0].to_i, input[1].to_i, input[2])
  end

  def to_s
    "#{ x } #{ y } #{ direction.type }"
  end
end
