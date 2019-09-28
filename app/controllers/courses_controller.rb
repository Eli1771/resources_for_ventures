class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def hardest
    
  end
end
