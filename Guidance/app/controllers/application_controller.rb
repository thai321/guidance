class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery prepend: true

  helper_method :current_user, :login?

  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def login?
    !!current_user
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_login!
    if !login?
      render json: ["You are not authorized to perform this action"], status: 401
    end
  end
end
