class Leaderboard

  def self.list2
    p1 = Game.group(:player1).order('count_id asc').count('id')
    p2 = Game.group(:player2).order('count_id asc').count('id')
    players = p1.merge(p2){|key, p1_value, p2_value| p1_value + p2_value}
    players.delete_if {|key, value| value < 10 } 
    members_with_at_least_ten_matches = []
    players.sort_by {|k,v| v}.reverse.first(10).each {|player|
      member = Member.find(player[0]) 
      profile = member.profile
      member_info = {
        :member => member,
        :score_avg => profile[:score_avg],
        :games_played => profile[:games_played] 
      }

      members_with_at_least_ten_matches << member_info    
    }
    members_with_at_least_ten_matches
  
  end

  def self.list
    members = Member.all
    members_with_at_least_ten_matches = []
    members.each { |member|
      profile = member.profile
      if (profile[:games_played] >= 10)
        member_info = {
          :member => member,
          :score_avg => profile[:score_avg],
          :games_played => profile[:games_played]
        }
        members_with_at_least_ten_matches << member_info
      end
    }
    members_with_at_least_ten_matches.sort_by! { |member_info|
      member_info[:score_avg]
    }
    #sort in descending order of score
    members_with_at_least_ten_matches.reverse!

    #get top ten
    members_with_at_least_ten_matches[0..9]
  end
end
