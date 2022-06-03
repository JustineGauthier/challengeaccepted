class ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[show]

  def index
    @challenges = Challenge.all
  end

  def show
    start_date = @challenge.start_date
    end_date = @challenge.end_date
    @time_left = (end_date - start_date).to_i
    @participations = @challenge.participations
    @users = @participations.map(&:user)
    @creator = @challenge.participations.first.user
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      @challenge.total_time = (@challenge.end_date - @challenge.start_date)
      user = current_user
      participation = Participation.new({ user: user, challenge: @challenge })
      participation.save
      redirect_to challenge_path(@challenge)
    else
      render :show
    end
  end

  def join
    redirect_to challenge_path
  end

  private

  def challenge_params
    params.require(:challenge).permit(:start_date, :end_date, :title, :photo, :description, :frequency)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
