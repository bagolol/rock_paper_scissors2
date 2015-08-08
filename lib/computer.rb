require_relative 'player'

class Computer < Player

  MOVES = [:rock, :paper, :scissors]

  def play
    move = MOVES.sample
    choices.push move
  end
end

