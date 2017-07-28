class SessionsController < ApplicationController
  def new #login?
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    else
      flash[:message] = "Nice Try Sucker -Z"
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
