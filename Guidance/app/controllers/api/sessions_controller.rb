class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
        params[:user][:username],
        params[:user][:password]
      )

    if @user.nil?
      # flash[:alert] = "Invalid Username or Password"
      render json: ["Invalid Username or Password"] , status: 401
    else
      login!(@user)
      # flash[:notice] = ['login']
      render @user #'/api/users/show'
    end

  end

  def destroy
    @user = current_user
    if @user
      logout!
      render @user #'/api/users/show'
    else
      render json: ["You have not signed in"], status: 404
    end
  end
end
