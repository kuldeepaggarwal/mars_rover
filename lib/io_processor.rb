require File.expand_path('plateau', __dir__)
require File.expand_path('nasa_signal', __dir__)
require File.expand_path('position', __dir__)

class IOProcessor

  def self.process(file_path)
    new(file_path).process
  end

  attr_reader :file_path
  def initialize(file_path)
    @file_path = file_path
  end

  def process
    inputs  = File.readlines(file_path)
    plateau = Plateau.new(*inputs.shift.split(' '))

    inputs.each_slice(2) do |rover_inputs, input_signals|
      rover_position = Position.parse(rover_inputs)
      signals        = NASASignal.parse(input_signals)
      plateau.add_rover(rover_position, signals)
    end
    plateau.move_rovers.push('==========')
  end
end

if __FILE__ == $0
  file_path = File.expand_path('../data/input.rb', __dir__)
  puts IOProcessor.process(file_path)
end
