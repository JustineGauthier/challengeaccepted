class ProgressionsController < ApplicationController
  def done
    progression = Progression.find(params[:id])
    progression.update!(done: true)
    user = progression.participation.user
    @new_points = user.total_points + progression.points
    user.update!(total_points: new_points)
    head :ok
  end

  def index
    @progressions = Progression.all
  end

  def new
    @progression = Progression.new
  end

  def edit
    @progression = Progression.find(params[:id])
  end

  def update
    @progression = Progression.find(params[:id])
    @progression.update(progression_params)

    redirect_to done_progression_path(@progression)
  end

  def create
    progression = Progression.find(params[:id])
    progression.save
    # à chaques click sur done, @progression_count doit s'incrémenter de 1
    @count = 0
    @progression_count = @count += 1

    # redirect_to buttons_path
  end

  def progression_params
    params.require(:progression).permit(:date, :done, :points, :new_points)
  end
end
