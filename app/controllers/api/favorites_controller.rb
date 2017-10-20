class Api::FavoritesController < ApplicationController
  before_action :require_user_login!

  def create
    favorite = Favorite.new(
      # user_id: current_user.id,
      user_id: favorites_params[:user_id],
      project_id: favorites_params[:project_id]
    )

    if favorite.save
      render json: {
        # userId: current_user.id,
        user_id: favorites_params[:user_id],
        projectId: favorites_params[:project_id]
      }, status: 200
    else
      render favorite.errors.full_messages, status: 422
    end
  end

  def destroy
    favorite = Favorite.find_by(
      # user_id: current_user.id,
      user_id: favorites_params[:user_id],
      project_id: favorites_params[:project_id]
    )

    if favorite.destroy
      render json: {
        # userId: current_user.id,
        user_id: favorites_params[:user_id],
        projectId: favorites_params[:project_id]
      }, status: 200
    else
      render favorite.errors.full_messages
    end
  end

  private
  def favorites_params
    params.require(:favorite).permit(:project_id, :user_id)
  end

  def require_user_login!
    if !current_user
      render json: ['Please Register or Login'], status: 422
    end
  end
end
