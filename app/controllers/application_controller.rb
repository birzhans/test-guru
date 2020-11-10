class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :admin_required!

  def after_sign_in_path_for(resources)
    flash[:notice] = "Hello, #{current_user.first_name}!"
    if current_user.admin?
      admin_tests_path
    else
      root_path
    end
  end

  def admin_required!
    redirect_to root_path, alert: 'You are not authorized to view this page.' unless current_user.admin?
  end
end
