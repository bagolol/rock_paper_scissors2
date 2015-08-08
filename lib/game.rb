require_relative 'player'
require_relative 'computer'
require_relative 'tactical_player'

class Game

  WINNING_COMBOS = { rock: :scissors,
                     scissors: :paper,
                     paper: :rock }

  attr_reader :player1, :player2, :score

  def initialize player1, player2
    @player1 = player1
    @player2 = player2
    @score = { player1: 0, player2: 0 }
  end

  def score_points
    player1_move = player1.choices.last
    player2_move = player2.choices.last

    if WINNING_COMBOS[player1_move] == player2_move
      score[:player1] += 1
    elsif player1_move == player2_move
      "draw"
    else
      score[:player2] += 1
    end
  end

  def declare_winner
    if score[:player1] == 2
      player1.name
    elsif score[:player2] == 2
      player2.name
    end
  end
end

