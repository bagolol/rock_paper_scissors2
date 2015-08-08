class Player

  attr_reader :name
  attr_accessor :choices

  def initialize name = 'Opponent'
    @name = name
    @choices = []
  end

  def play move
    choices.push move
  end

  def last_move
    choices.last
  end
end

