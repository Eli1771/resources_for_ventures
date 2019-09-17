class User < ApplicationRecord
  validates :name, { presence: true }
  validates :email, { presence: true }
  validates :password_digest, { presence: true }
  validates :course_id, {presence: true}

  has_many :assignments
  has_many :materials, through: :assignments
  belongs_to :course

  has_secure_password

  before_save :default_values

  scope :teachers, -> { where(is_teacher: true) }
  scope :students, -> { where(is_teacher: false) }

  def correct_user_path
    self.is_teacher ? "/teachers/#{self.id}" : "/students/#{self.id}"
  end

  def type
    self.is_teacher ? 'Teacher' : 'Student'
  end

  def default_values
    if self.is_teacher.nil?
      self.is_teacher = false
    end
  end
end
