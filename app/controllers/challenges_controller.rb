class ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[show]

  def index
    @challenges = Challenge.all
  end

  def show
    now = Date.today
    end_date = @challenge.end_date
    @time_left = (end_date - now).to_i
    @participations = @challenge.participations
    @users = @participations.map(&:user)
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      @challenge.total_time = (@challenge.end_date - @challenge.start_date)
      @challenge.save
      user = current_user
      participation = Participation.new
      participation.user_id = user
      redirect_to challenge_path(@challenge)
    else
      render :show
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:start_date, :end_date, :title, :photo, :description, :frequency)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
