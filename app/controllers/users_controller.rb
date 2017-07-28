class UsersController < ApplicationController
  before_action :logged_in, only: :homepage

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if !@user.save
      redirect_to new_user_path
    else
      session[:user_id] = @user.id
    redirect_to homepage_path
    end
  end

  def homepage
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
