class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to @user.correct_user_path
    else
      redirect_to signin_path
    end
  end

  def fb_create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    session[:user_id] = @user.id
    redirect_to @user.correct_user_path
  end

  def destroy
    session.delete :user_id
    redirect_to signin_path
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

  def auth
    request.env['omniauth.auth']
  end
end
