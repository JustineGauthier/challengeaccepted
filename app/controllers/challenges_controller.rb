class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @user = current_user
    @challenge.user = @user
    if @challenge.save
      @challenge.total_time = (@challenge.end_date - @challenge.start_date)
      @challenge.save
      redirect_to users_path
    else
      render 'challenge'
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to users_path
  end

  private

  def challenge_params
    params.require(:challenge).permit(:start_date, :end_date, :title, :description, :frequency, :points)
  end
end
