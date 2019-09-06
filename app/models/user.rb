class User < ApplicationRecord
  has_many :assignments
  has_many :materials, through: :assignments
  belongs_to :course

  has_secure_password

  scope :teachers, -> { where(is_teacher: true) }
  scope :students, -> { where(is_teacher: false) }

  def correct_user_path
    self.is_teacher ? "/teachers/#{self.id}" : "/students/#{self.id}"
  end

  def type
    self.is_teacher ? 'Teacher' : 'Student'
  end
end
