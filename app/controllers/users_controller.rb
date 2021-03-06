class UsersController < ApplicationController
  def home
  end

  def new
    @user = User.new
  end

  def create
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
    if auth
      @user = User.find_or_create_by_omniauth(auth)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.name}! Successfully signed up!"
        redirect_to @user.correct_user_path
      else
        render :new
      end
    else
      flash[:failure] = 'Sorry, there was an error connecting to Facebook. Please try again.'
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

  def edit
    @user = User.find(params[:id])
    current_user = User.find(session[:user_id])
    if @user != current_user
      flash[:failure] = 'You can\'t edit another user\'s profile!'
      redirect_to current_user.correct_user_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.is_teacher = params[:user][:is_teacher]
    @user.save
    flash[:success] = 'You have successfully updated your profile!'
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
