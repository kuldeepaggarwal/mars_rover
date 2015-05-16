require File.expand_path('rover', __dir__)

class Plateau
  def rovers
    @rovers ||= []
  end

  def move_rovers
    rovers.map(&:move)
  end

  def add_rover(*attributes)
    rovers.push(Rover.new(*attributes, self))
  end

  def attainable_position?(_)
    false
  end

  def self.parse(input)
    parameters = input.split(' ')
    klass_type = parameters.shift
    klass_type.downcase!
    klass_type[0] = klass_type[0].upcase
    klass = "#{ klass_type }Plateau"
    Object.const_get(klass).new(*parameters)
  end
end

Dir[File.expand_path('plateaus/*.rb', __dir__)].each { |file| require file }
