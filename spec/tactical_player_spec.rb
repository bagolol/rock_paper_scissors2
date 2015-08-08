require 'tactical_player'

describe TacticalPlayer do

  let(:tacticalplayer) { double :tacticalplayer, choiches: [:scissors] }

  before(:each) do
    @tactical_player = TacticalPlayer.new
  end

  context 'when initialised' do
    it 'has a name' do
      expect(@tactical_player.name).to eq "Opponent"
    end

    it 'has no moves stored' do
      expect(@tactical_player.choices.length).to eq (0)
    end
  end

  context 'when playing' do
    it 'plays the move that would beat the previous move' do
      subject.choices = [:scissors]
      subject.play
      expect(subject.choices.last).to eq :rock
    end
  end
end