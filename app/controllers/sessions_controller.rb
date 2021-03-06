class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Successfully logged in'
      redirect_to @user.correct_user_path
    else
      flash[:failure] = 'Incorrect log in info. Please try again.'
      redirect_to signin_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to signin_path
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
