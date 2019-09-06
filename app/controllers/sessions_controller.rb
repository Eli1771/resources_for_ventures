class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      if @user.is_teacher
        redirect_to "/teachers/#{@user.id}"
      else
        redirect_to "/students/#{@user.id}"
      end
    else
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
