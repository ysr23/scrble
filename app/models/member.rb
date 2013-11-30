class Member < ActiveRecord::Base
  attr_accessible :address1, :adress2, :city, :joindate, :name, :postcode
  has_many :games

  def profile
    games_played = Game.where("player1 = ? OR player2 = ?", self.id, self.id)
    scores = [] 
    hi_score = 0
    hi_score_opponent_id = 0
    hi_score_game_location = ""
    hi_score_game_date = nil 
    games_played.each do |game|
      score = 0
      opponent_id = 0
      if game.player1 == self.id
        score = game.p1_score
        opponent_id = game.player2
      else
        score = game.p2_score
        opponent_id = game.player1
      end   
      scores << score
      if score > hi_score
        hi_score = score
        hi_score_opponent_id = opponent_id
        hi_score_game_location = game.location
        hi_score_game_date = game.date_played
      end
    end

    #look up high scoring opponent member details from id
    puts hi_score_opponent_id
    
    profile = {
      :games_played => games_played.count,
      :scores => scores,
      :score_avg => scores.sum / scores.size.to_f,
      :games_won => Game.where(:winner => self.id).count,
      :games_lost => Game.where(:loser => self.id).count,
      :hi_score => hi_score,
      :hi_score_game_location => hi_score_game_location,
      :hi_score_game_date => hi_score_game_date
    }

  end
end
