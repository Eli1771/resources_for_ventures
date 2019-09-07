module SessionsHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    user = User.find(session[:user_id])
  end

  def correct_navbar
    if !logged_in?
      'signed_out_navbar'
    else
      if current_user.is_teacher
        'teacher_navbar'
      else
        'student_navbar'
      end
    end 
  end
end
