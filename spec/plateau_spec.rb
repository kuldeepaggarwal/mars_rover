require File.expand_path('../../lib/plateau', __FILE__)

describe LSignal, 'behaviour' do
  let(:square_input) { 'SQUARE 0 0 5' }
  let(:circle_input) { 'CIRCLE 5 5 2' }

  it 'parses the input and return corresponding plateau' do
    expect(Plateau.parse(square_input)).to be_an_instance_of(SquarePlateau)
    expect(Plateau.parse(square_input)).to be_an_instance_of(SquarePlateau)
  end
end
