class StudentsController < ApplicationController
  def index
    @students = User.students
  end

  def show
    @student = User.find(session[:user_id])
    @assignments = @student.assignments
  end
end
