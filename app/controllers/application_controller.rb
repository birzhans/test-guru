class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resources)
    flash[:notice] = "Hello, #{current_user.first_name}!"
    if current_user.admin?
      admin_tests_path
    else
      root_path
    end
  end
end
