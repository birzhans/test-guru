class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to_back
    else
      flash[:alert] = 'Verify your email and password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def redirect_to_back
    if cookies[:previous_url] != login_path
      redirect_to cookies[:previous_url]
    else
      cookies[:previous_url]
    end
    cookies[:previous_url] = nil
  end
end
