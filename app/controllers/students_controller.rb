class StudentsController < ApplicationController
  def index
    @students = User.students
  end

  def show
    @student = User.find(params[:id])
    @teachers = User.teachers.select {|t| t.course_id == @student.course_id}
    @assignments = @student.assignments
  end
end
