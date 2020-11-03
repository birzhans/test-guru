class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def authenticate_user!
    unless current_user
      cookies[:previous_url] = request.url
      redirect_to login_path, alert: 'Verify your email and password'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
