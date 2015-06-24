require File.expand_path('../../lib/position', __FILE__)
require File.expand_path('../../lib/plateau', __FILE__)

describe Position, 'behaviour' do
  let(:position) { Position.new(1, 2, 'N') }
  let(:plateau) { SquarePlateau.new(0, 0, 3) }

  it 'moves iff the new position is achievable in the plateau' do
    position.move!(MSignal.new, plateau)
    expect(position.y).to eq(3)

    position.move!(MSignal.new, plateau)
    expect(position.y).to eq(3)
  end
end
