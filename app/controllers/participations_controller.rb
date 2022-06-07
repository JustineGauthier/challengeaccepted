class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @challenge = Challenge.find(params[:challenge_id])
    @participation = Participation.new(user: @user, challenge: @challenge)
    if @participation.save
      create_progressions(@challenge, @participation)
    end
  end

  private

  def create_progressions(challenge, participation)
    case challenge.frequency
    when "Quotidiennement"
      daily_progression(challenge, participation)
    when "Une fois par semaine"
      weekly_progression(challenge, participation)
    when "Une seule fois à la fin"
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
