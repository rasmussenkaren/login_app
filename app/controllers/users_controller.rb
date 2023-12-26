class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    begin
      user.save!
      UserMailer.verification_email(user).deliver_now!
      redirect_to login_path, notice: 'Registro completado con éxito. Se ha enviado un correo electrónico para su verificación.'
    rescue => error
      redirect_to register_path, alert: error.message
    end
  end

  def destroy
    user = User.find(params[:id])

    user.destroy
    redirect_to users_path
  end

  def verify_email
    user = User.find_by(email: params[:email])
    if user
      user.update_column(:email_verified, true)
      flash[:notice] = 'Correo electrónico verificado correctamente.'
    else
      flash[:alert] = 'Email de verificación no válido.'
    end

    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
