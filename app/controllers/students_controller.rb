class StudentsController < ApplicationController
  def show
    @student = User.find(params[:id])
    render 'show'
  end
end
