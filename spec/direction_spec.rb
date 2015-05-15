require File.expand_path('../../lib/position', __FILE__)
require File.expand_path('../../lib/nasa_signal', __FILE__)

describe LSignal, 'behaviour' do
  let(:position) { Position.new(1, 2, 'N') }
  let(:signal) { LSignal.new }

  it 'only changes the direction' do
    expect(signal.move_position(position).to_s).to eq('1 2 W')
  end
end

describe RSignal, 'behaviour' do
  let (:position) { Position.new(1, 2, 'N') }
  let(:signal) { RSignal.new }

  it 'only changes the direction' do
    expect(signal.move_position(position).to_s).to eq('1 2 E')
  end
end


describe MSignal, 'behaviour' do
  let (:position) { Position.new(1, 2, 'N') }
  let(:signal) { MSignal.new }

  it 'only moves the position by step 1 in the current direction' do
    expect(signal.move_position(position).to_s).to eq('1 3 N')
  end
end
