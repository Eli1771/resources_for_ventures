class StudentsController < ApplicationController
  def index
    @students = User.students
  end

  def show
    @student = User.find(params[:id])
    render 'show'
  end
end
