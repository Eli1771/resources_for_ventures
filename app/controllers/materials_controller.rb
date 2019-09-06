class MaterialsController < ApplicationController
  def new
  end

  def create
    @material = Material.create(materials_params)
    redirect_to material_path(@material)
  end

  def index
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])
  end

  private

  def materials_params
    params.require(:material).permit(:name, :description, :url, :course_id)
  end
end
