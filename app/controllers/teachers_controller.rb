class TeachersController < ApplicationController
  def index
    @teachers = User.teachers
  end

  def show
    @teacher = User.find(params[:id])
    @assignments = Assignment.all.select {|a| a.creator_id == @teacher.id}
    redirect_if_not_teacher(current_user)
  end

  private

  def current_user
    User.find(session[:user_id])
  end

  def redirect_if_not_teacher(user)
    if user.is_teacher == false
      flash[:message] = 'Sorry, students don\'t have permission to view that page'
      redirect_to user.correct_user_path
    end
  end
end
