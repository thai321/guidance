class Api::FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(
      user_id: current_user.id,
      project_id: favorites_params[:project_id]
    )

    if favorite.save
      render json: {
        userId: current_user.id,
        projectId: favorites_params[:project_id]
      }, status: 200
    else
      render favorite.errors.full_messages, status: 422
    end
  end

  def destroy
    favorite = Favorite.find_by(
      user_id: current_user.id,
      project_id: favorites_params[:project_id]
    )

    if favorite.destroy
      render json: {
        userId: current_user.id,
        projectId: favorites_params[:project_id]
      }, status: 200
    else
      render favorite.errors.full_messages
    end
  end

  private
  def favorites_params
    params.require(:favorite).permit(:project_id)
  end
end
