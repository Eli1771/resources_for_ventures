class MaterialsController < ApplicationController
  def new
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
end
