class AssignmentsController < ApplicationController
  def new
  end

  def create
    @assignment = Assignment.create(assignment_params)
    redirect_to assignment_path(@assignment)
  end

  private

  def assignment_params
    params.require(:assignment).permit(:student_id, :material_id, :mark_as_viewed)
  end
end
