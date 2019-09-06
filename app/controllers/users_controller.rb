class UsersController < ApplicationController
  def new
  end

  def create
    binding.pry
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :course_id, :is_teacher)
  end
end
