require 'game'

feature 'the winner is whoever wins 3 matches' do

  scenario 'player1 wins' do
    game = Game.new Player.new, Computer.new
    3.times do
      game.player1.play "scissors"
      game.player2.moves = :paper
      game.check
    end
    expect(game.winner).to eq :player1
  end


  scenario 'player2 wins' do
    game = Game.new Player.new, Computer.new
    3.times do
      game.player1.play "rock"
      game.player2.moves = :paper
      game.check
    end
    expect(game.winner).to eq :player2
  end
end