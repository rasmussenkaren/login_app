class SessionsController < ApplicationController
  def new
    unless @current_user
      @user = User.new
    else
      redirect_to users_path, notice: 'Ya has iniciado sesión.'
    end
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password]) && user&.email_verified
      session[:user_id] = user.id
      redirect_to users_path
    elsif user && !user.email_verified
      redirect_to login_path, alert: 'Correo electrónico no verificado.'
    else
      flash.alert = 'Correo electrónico o contraseña incorrectos.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
