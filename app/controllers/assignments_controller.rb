class AssignmentsController < ApplicationController
  def new
  end

  def create
    #ensure you can't edit html to select teacher
    @assignment = Assignment.create(assignment_params)
    redirect_to assignment_path(@assignment)
  end

  def index
    #add timestamps
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def patch
    @assignment = Assignment.find(params[:id])
    @assignment.viewed = true
    @assignmnet.save
  end

  private

  def assignment_params
    params.require(:assignment).permit(:user_id, :material_id, :mark_as_viewed)
  end
end
