class AssignmentsController < ApplicationController
  def new
    redirect_if_not_teacher(User.find(session[:user_id]))
  end

  def create
    #ensure you can't edit html to select teacher

    #Assingment.new first for error hangling
    @assignment = Assignment.create(assignment_params)
    redirect_to assignment_path(@assignment)
  end

  def index
    #add timestamps
    @assignments = Assignment.all
  end

  def show
    @user = User.find(session[:user_id])
    @assignment = Assignment.find(params[:id])
  end

  def update
    #binding.pry
    assignment = Assignment.find(params[:assignment_id])
    assignment.viewed = true
    assignment.save
    redirect_to assignment_path(assignment)
  end

  private

  def assignment_params
    params.require(:assignment).permit(:assignment_id, :user_id, :material_id, :creator_id, :mark_as_viewed)
  end

  #dry this out
  def redirect_if_not_teacher(user)
    if user.is_teacher == false
      flash[:failure] = 'Sorry, students don\'t have permission to view that page'
      redirect_to user.correct_user_path
    end
  end
end
