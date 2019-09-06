class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    if @user.is_teacher
      redirect_to "/teachers/#{@user.id}"
    else
      redirect_to "/students/#{@user.id}"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :course_id, :is_teacher)
  end
end
