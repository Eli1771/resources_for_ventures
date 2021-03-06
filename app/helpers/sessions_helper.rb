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
      current_user.correct_user_path
    else
      root_url
    end
  end

  def viewing_current_user?(user)
    current_user.id == user.id ? true : false
  end

  def logged_in_style
    logged_in? ? 'logged-in' : 'logged-out'
  end
end
