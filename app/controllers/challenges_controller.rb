class ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[show started progression_count_current_user total_point_challenge]

  def index
    @challenges = Challenge.all
  end

  def show
    @time_left = (@challenge.end_date - Date.today).to_i
    @challenge.total_time = (@challenge.end_date - @challenge.start_date)
    @participations = @challenge.participations
    @users = @participations.map(&:user)
    @creator = @challenge.participations.first.user
    @progression_count_current_user = progression_count_current_user
    @total_points_count = total_points_challenge
  end

  def progression_count_current_user
    user = current_user
    @progression_count = 0
    user.participations.each do |participation|
      if participation.challenge_id == @challenge.id
        participation.progressions.each do |progression|
          if progression.done
            @progression_count += 1
          end
        end
      end
    end
    return @progression_count
  end

  def total_points_challenge
    user = current_user
    @total_points_count = 0
    user.participations.each do |participation|
      if participation.challenge_id == @challenge.id
        participation.progressions.each do |progression|
          if progression.done
            @total_points_count += 1
          end
        end
      end
    end
    return @total_points_count
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      total_time = (@challenge.end_date - @challenge.start_date)
      @challenge.update(total_time: total_time, started: false)
      @user = current_user
      participation = Participation.new(user: @user, challenge: @challenge)
      participation.save
      create_progressions(@challenge, participation)
      redirect_to challenge_path(@challenge)
    else
      render :show
    end
  end

  def join
    redirect_to challenge_path
  end

  def started
    @challenge.update!(started: true)
    head :ok
  end

  private

  def challenge_params
    params.require(:challenge).permit(:start_date, :end_date, :title, :photo, :description, :frequency)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def create_progressions(challenge, participation)
    case challenge.frequency
    when "Quotidien"
      daily_progression(challenge, participation)
    when "Hebdomadaire"
      weekly_progression(challenge, participation)
    when "Unique"
      monthly_progression(challenge, participation)
    end
  end

  def daily_progression(challenge, participation)
    duration = challenge.total_time
    date = challenge.start_date - 1
    while duration.positive?
      new_date = date += 1
      Progression.create!(date: new_date, participation: participation, points: 10, done: false)
      duration -= 1
    end
  end

  def weekly_progression(challenge, participation)
    duration = challenge.total_time
    date = challenge.start_date - 7
    while duration.positive?
      new_date = date += 7
      Progression.create!(date: new_date, participation: participation, points: 50, done: false)
      duration -= 7
    end
  end

  def monthly_progression(challenge, participation)
    new_date = challenge.end_date
    Progression.create!(date: new_date, participation: participation, points: 150, done: false)
  end
end
