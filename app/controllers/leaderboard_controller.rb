class LeaderboardController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end 
  end

end
