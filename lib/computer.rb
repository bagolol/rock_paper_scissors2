require_relative 'player' # perche' qui ci va require?

class Computer < Player

  MOVES = [:rock, :paper, :scissors]

  def play
    move = MOVES.sample
    choices.push move
  end
end
