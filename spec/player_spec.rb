require 'player'

describe Player do

  before(:each) do
    @player = Player.new 'Rocco'
  end

  context 'when initialised' do
    it 'has a name' do
      expect(@player.name).to eq 'Rocco'
    end

    it 'has no moves stored' do
      expect(@player.choices.length).to eq (0)
    end
  end

  context 'when playing' do
    it 'can play a move of his own choice' do
      @player.play :scissors
      expect(@player.choices).to eq [:scissors]
    end
  end
end