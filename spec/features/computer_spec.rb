require 'computer'

describe Computer do

  before(:each) do
    @computer = Computer.new
  end

  context 'when initialised' do
    it 'has a default name' do
      expect(@computer.name).to eq 'Opponent'
    end

    it 'has no moves stored' do
      expect(@computer.choices.length).to eq (0)
    end
  end

  context 'when playing' do
    it 'can play a random move' do
      @computer.play
      expect(@computer.choices).not_to eq nil
    end
  end
end