require_relative 'player'

class TacticalPlayer < Computer

  WINNING_COMBOS = { rock: :scissors,
                     scissors: :paper,
                     paper: :rock }

  def play
    if choices.empty?
      move = MOVES.sample
      choices.push move
    else
      last_move = choices.last
      move = find_move last_move
      choices.push move
    end
  end

  private

  def find_move move
    WINNING_COMBOS.key(move)
  end
end