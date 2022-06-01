class ProgressionsController < ApplicationController
  def done
    progression = Progression.find(params[:id])
    progression.update!(done: true)
    head :ok
  end
end
