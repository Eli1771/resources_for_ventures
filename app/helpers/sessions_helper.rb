module SessionsHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    user = User.find(session[:user_id])
  end

  def current_user_teacher?
    logged_in? && current_user.is_teacher ? true : false
  end

  def correct_navbar
    if !logged_in?
      'signed_out_navbar'
    else
      if current_user_teacher?
        'teacher_navbar'
      else
        'student_navbar'
      end
    end
  end

  def homepage_path
    if logged_in?
      "/users/#{current_user.id}"
    else
      root_url
    end
  end
end
