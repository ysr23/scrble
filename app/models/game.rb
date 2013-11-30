class Game < ActiveRecord::Base
  attr_accessible :date_played, :draw, :location, :loser, :p1_score, :p2_score, :player1, :player2, :winner
  has_many :members
  validates :player1, presence: true
  validates :player2, presence: true
  validates :p1_score, presence: true
  validates :p2_score, presence: true

  def self.calc_game(game)
    case game.p1_score <=> game.p2_score
      when 1; game.winner = game.player1; game.loser = game.player2
      when 0; game.draw = true
      when -1; game.winner = game.player2; game.loser = game.player1
    end
  game
  end
end
