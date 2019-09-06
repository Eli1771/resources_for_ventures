class User < ApplicationRecord
  has_many :assignments
  has_many :materials, through: :assignments
  belongs_to :course

  has_secure_password

  def correct_user_path
    if self.is_teacher
      return "/teachers/#{self.id}"
    else
      return "/students/#{self.id}"
    end
  end
end
