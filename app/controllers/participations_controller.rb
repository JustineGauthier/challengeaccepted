class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @challenge = Challenge.find(params[:challenge_id])
    @participation = Participation.new(user: @user, challenge: @challenge)
    @participation.save
  end
end
