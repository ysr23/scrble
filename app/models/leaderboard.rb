class Leaderboard

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
    members_with_at_least_ten_matches.sort_by { |member_info|
      member_info[:score_avg]
    }
    #sort in descending order of score
    members_with_at_least_ten_matches.reverse!

    #get top ten
    members_with_at_least_ten_matches[0..9]
  end
end
