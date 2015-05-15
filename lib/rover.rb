Rover = Struct.new(:current_position, :signals, :plateau) do
  def move
    while signal = signals.shift
      current_position.move!(signal, plateau)
    end
    current_position
  end
end
