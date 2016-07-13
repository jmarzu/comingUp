class SessionsController < ApplicationController

  user = User.authenitcate(user_params)

  def new
  end

  def create
    if user
      session[:user_id] = user.id
      flash[:success] = 'You are logged in'
      redirect_to root_path
    else
      flash[:danger] = 'Credentials invalid, please try again'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You are logged out'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
