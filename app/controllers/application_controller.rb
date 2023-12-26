class ApplicationController < ActionController::Base
  before_action :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user
    unless @current_user
      redirect_to login_path, alert: "Debes iniciar sesión para acceder a la página."
    end
  end
end
