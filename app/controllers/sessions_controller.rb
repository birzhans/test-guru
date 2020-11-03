class SessionsController < ApplicationController
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
    redirect_to cookies[:previous_url] || root_path
    cookies[:previous_url] = nil
  end
end
