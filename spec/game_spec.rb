require 'game'

describe Game do

  let(:player1) { double :player, score: 1, name: 'Rocco' }
  let(:player2) { double :player, score: 1 }

  before(:each) do
    @game = Game.new(player1, player2)
  end

  def play_one_round(player1, choice1, player2, choice2)
    allow(player1).to receive(:choices).and_return(choice1)
    allow(player2).to receive(:choices).and_return(choice2)
    @game.score_points
  end

  context 'when playing 1 round' do
    it 'knows that paper beats rock' do
      play_one_round(player1, [:paper], player2, [:rock])
      expect(@game.score[:player1]).to eq(1)
    end

    it 'knows that rock beats scissors' do
      play_one_round(player1, [:rock], player2, [:scissors])
      expect(@game.score[:player1]).to eq(1)
    end

    it 'knows that scissors beats paper' do
      play_one_round(player1, [:scissors], player2, [:paper])
      expect(@game.score[:player1]).to eq(1)
    end

    it 'knows when there is a draw' do
      play_one_round(player1, [:rock], player2, [:rock])
      expect(@game.score[:player1]).to eq(0)
      expect(@game.score[:player2]).to eq(0)
    end
  end

  context 'when playing multiple rounds' do
    it 'knows the score of each player' do
      play_one_round(player1, [:rock], player2, [:scissors])
      play_one_round(player1, [:rock, :rock], player2, [:scissors, :scissors])
      expect(@game.score[:player1]).to eq(2)
      expect(@game.score[:player2]).to eq(0)
    end

    it 'knows the score is a 1-1 draw' do
      play_one_round(player1, [:rock], player2, [:scissors])
      play_one_round(player1, [:rock, :scissors], player2, [:rock, :rock])
      expect(@game.score[:player1]).to eq(1)
      expect(@game.score[:player2]).to eq(1)
    end

    it 'knows the score is a 1-1 after 1 win each and a draw' do
      play_one_round(player1, [:rock], player2, [:scissors])
      play_one_round(player1, [:rock, :scissors], player2, [:rock, :rock])
      play_one_round(player1, [:rock, :scissors, :scissors], player2, [:rock, :rock, :scissors])
      expect(@game.score[:player1]).to eq(1)
      expect(@game.score[:player2]).to eq(1)
    end

    it 'knows who is the winner' do
      play_one_round(player1, [:paper], player2, [:rock])
      play_one_round(player1, [:paper, :scissors], player2, [:rock, :paper])
      expect(@game.declare_winner).to eq 'Rocco'
    end
  end
end