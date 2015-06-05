require_relative 'player'
require_relative 'computer'
class Game

  attr_reader :player1, :player2, :messages

  def initialize player1, player2
    @player1 = player1
    @player2 = player2
    @messages = {:player1 => "#{@user} wins!",
                 :player2 => "Computer wins!",
                 :draw => "DRAW!",
                 :play => "Keep playng to win"}
  end

  def restart_game
    @player1.won = 0
    @player2.won = 0
  end

  def check
    a = player1.moves
    b = player2.moves
    @draw = false;


    if a == b
      @draw = true
    elsif a == :rock && b == :scissors
      @player1.won += 1
    elsif a == :scissors && b == :paper
      @player1.won += 1
    elsif a == :paper && b == :rock
      @player1.won += 1
    else
      @player2.won += 1
    end
    winner
  end

  def winner
    if @player1.won == 3
      :player1
    elsif @player2.won == 3
      :player2
    elsif @draw == true
      :draw
    else
      :play
    end
  end
end

