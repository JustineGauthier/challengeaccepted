class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @challenge = Challenge.find(params[:challenge_id])
    @participation = Participation.new(user: @user, challenge: @challenge)
    duration = @challenge.total_time
    if @participation.save
      case @challenge.frequency
      when "Quotidien"
        date = @challenge.start_date - 1
        while duration.positive?
          new_date = date += 1
          Progression.new(date: new_date, participation: @participation, points: 10)
          duration -= 1
          Progression.save
        end
      when "Hebdomadaire"
        date = @challenge.start_date - 7
        while duration.positive?
          new_date = date += 7
          Progression.new(date: new_date, participation: @participation, points: 50)
          duration -= 7
          Progression.save
        end
      when "Unique"
        new_date = @challenge.end_date
        Progression.new(date: new_date, participation: @participation, points: 150)
        Progression.save
      end
    end
  end
end
