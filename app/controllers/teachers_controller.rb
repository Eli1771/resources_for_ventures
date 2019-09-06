class TeachersController < ApplicationController
  def show
    @teacher = User.find(params[:id])
    render :show
  end
end
