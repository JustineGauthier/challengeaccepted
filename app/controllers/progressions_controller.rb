class ProgressionsController < ApplicationController
  def done
    progression = Progression.find(params[:id])
    progression.update!(done: true)
    user = progression.participation.user
    new_points = user.total_points + progression.points
    user.update!(total_points: new_points)
    head :ok
  end

  def new
    @progression = Progression.new
  end

  def create
    progression = Progression.find(params[:id])
    progression.save
  end

  def progression_params
    params.require(:progression).permit(:date, :done, :points, :new_points)
  end
end
