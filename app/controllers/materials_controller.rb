class MaterialsController < ApplicationController
  def new
    redirect_if_not_teacher(User.find(session[:user_id]))
    @material = Material.new(course_id: params[:course_id])
  end

  def create
    @material = Material.new(materials_params)
    if @material.save
      redirect_to material_path(@material)
    else
      render :new
    end
  end

  def index
    if params[:course_id]
      @materials = Course.find(params[:course_id]).materials
    else
      @materials = Material.all
    end
  end

  def show
    @material = Material.find(params[:id])
  end

  private

  def materials_params
    params.require(:material).permit(:name, :description, :url, :course_id)
  end

  #dry this out
  def redirect_if_not_teacher(user)
    if user.is_teacher == false
      flash[:failure] = 'Sorry, students don\'t have permission to view that page'
      redirect_to user.correct_user_path
    end
  end
end
