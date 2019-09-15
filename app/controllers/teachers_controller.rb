class TeachersController < ApplicationController
  def index
    @teachers = User.teachers
  end

  def show
    @teacher = User.find(params[:id])
    @students = User.students.select {|s| s.course_id == @teacher.course_id}
    @assignments = Assignment.all.select {|a| a.creator_id == @teacher.id}
    redirect_if_not_teacher(current_user)
  end

  private

  def current_user
    User.find(session[:user_id])
  end


  #dry this out
  def redirect_if_not_teacher(user)
    if user.is_teacher == false
      flash[:failure] = 'Sorry, students don\'t have permission to view that page'
      redirect_to user.correct_user_path
    end
  end
end
