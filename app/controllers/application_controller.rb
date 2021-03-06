class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def require_user
    redirect_to new_user_path unless current_user
  end

  def current_user
    @current_user = User.find_by id: cookies.signed[:user_id]
  end
end
