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

  def self.find_or_create_by_omniauth(fb_auto_hash)
    where(uid: fb_auto_hash['uid']).first_or_create do |user|
      user.email = fb_auto_hash['info']['email']
      user.name = fb_auto_hash['info']['name']
      user.password = SecureRandom.hex
      user.course_id = 1
    end
  end

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

  def is_current_user?(current_user_id)
    self.id == current_user_id ? true : false
  end
end
