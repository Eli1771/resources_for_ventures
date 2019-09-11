class UsersController < ApplicationController
  def home
  end

  def new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user.correct_user_path
  end

  def fb_create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    session[:user_id] = @user.id
    redirect_to @user.correct_user_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :course_id, :is_teacher)
  end
end
