module UsersHelper
  def correct_user_path(user)
    if user.is_teacher
      redirect_to "/teachers/#{user.id}"
    else
      redirect_to "/students/#{user.id}"
    end
  end
end
