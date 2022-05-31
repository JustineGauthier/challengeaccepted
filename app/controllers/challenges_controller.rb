class ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[show]

  def show
    now = Date.today
    end_date = @challenge.end_date
    @time_left = (end_date - now).to_i
    @users = @challenge.participations.map(&:user)
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
