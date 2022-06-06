class UsersController < ApplicationController
  def show
    @user = current_user
    @participations = @user.participations.includes(:progressions)
    @challenges = @participations.map(&:challenge)
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :photo)
  end
end
