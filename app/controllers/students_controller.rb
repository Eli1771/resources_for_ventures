class StudentsController < ApplicationController
  def index
    @students = User.all.select {|u| !u.is_teacher}
  end

  def show
    @student = User.find(params[:id])
    render 'show'
  end
end
