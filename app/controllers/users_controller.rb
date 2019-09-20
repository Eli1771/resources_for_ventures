class UsersController < ApplicationController
  def home
  end

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)
    if !!params[:facebook]
      redirect_to '/auth/facebook/callback'
    elsif @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}! Successfully signed up!"
      redirect_to @user.correct_user_path
    else
      render :new
    end
  end

  def fb_create
    binding.pry
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}! Successfully signed up!"
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to @user.correct_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :course_id, :is_teacher)
  end

  def auth
    request.env['omniauth.auth']
  end
end
