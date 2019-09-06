class MaterialsController < ApplicationController
  def new
  end

  def create
    
  end

  def index
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])
  end
end
