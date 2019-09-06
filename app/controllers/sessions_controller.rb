class SessionsController < ApplicationController
  def new
  end

  def create
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end 
end
