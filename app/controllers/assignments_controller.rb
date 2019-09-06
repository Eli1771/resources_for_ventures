class AssignmentsController < ApplicationController
  def new
  end

  def create
    #ensure you can't edit html to select teacher
    binding.pry
    @assignment = Assignment.create(assignment_params)
    redirect_to assignment_path(@assignment)
  end

  def index
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  private

  def assignment_params
    params.require(:assignment).permit(:user_id, :material_id, :mark_as_viewed)
  end
end
