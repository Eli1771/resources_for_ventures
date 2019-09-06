class UsersController < ApplicationController
  def new
  end

  def create
    if params[:is_teacher]
      @user = Teacher.create(user_params)
    else
      @user = Student.create(user_params)
    end 
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :course_level, :is_teacher)
  end
end
