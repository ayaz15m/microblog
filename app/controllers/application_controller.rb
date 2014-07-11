class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_user

  def set_user
    if login_signed_in?
      @current_user = User.find_by(name: current_login.name)
    end
  end

end
