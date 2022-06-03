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
    when "Quotidien"
      daily_progressions(challenge, participation)
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
      Progression.new(date: new_date, participation: participation, points: 10)
      duration -= 1
      Progression.save
    end
  end

  def weekly_progression(challenge, participation)
    date = challenge.start_date - 7
    while duration.positive?
      new_date = date += 7
      Progression.new(date: new_date, participation: participation, points: 50)
      duration -= 7
      Progression.save
    end
  end

  def monthly_progression(challenge, participation)
    new_date = challenge.end_date
    Progression.new(date: new_date, participation: participation, points: 150)
    Progression.save
  end
end
