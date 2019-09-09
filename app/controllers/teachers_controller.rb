class TeachersController < ApplicationController
  def index
    @teachers = User.teachers
  end

  def show
    @teacher = User.find(params[:id])
    @assignments = Assignment.all.select {|a| a.creator_id == @teacher.id}
  end
end
