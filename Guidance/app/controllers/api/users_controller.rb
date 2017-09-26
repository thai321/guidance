class Api::UsersController < ApplicationController
  before_action :require_user!, only: [:update]


  def index
    if(user_params[:followee_id])
      @users = User.find(user_params[:followee_id]).followers
    elsif (user_params[:follower_id])
      @users = User.find(user_params[:follower_id]).followees
    else
      @users = User.all
    end

    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      render :show
    else
      flash[:alert] = @user.errors.full_messages
      render json: @user.errors.full_messages, status: 401
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:id ,:username, :password, :email, :image, :followee_id, :follower_id)
  end

  def require_user!
    if !params[:user][:id] || current_user.id != params[:user][:id].to_i
      render json: ["You are not authorized to perform this action"],  status: 401
    end
  end
end
