require 'game'

describe Game do

  let(:player1) {double :player}
  let(:player2) {double :computer }


  it 'knows when player1 wins' do
    game = Game.new(player1, player2)
    3.times do
      allow(player1).to receive(:moves).and_return(:rock)
      allow(player2).to receive(:moves).and_return(:paper)
      allow(player1).to receive(:won).and_return(1)
    end
    expect(game.check).to eq :player1
  end

  xit 'knows when there is a draw' do
    allow(player2).to receive(:moves).and_return(:rock)
    allow(player1).to receive(:moves).and_return('rock')
    expect(game.check).to eq :draw
  end

  xit 'knows when player1 loses' do


  end
end