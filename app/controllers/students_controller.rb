class StudentsController < ApplicationController
  def index
    @students = User.students
  end

  def show
    @student = User.find(params[:id])
    @assignments = @student.assignments
  end
end
