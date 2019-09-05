class Teacher < ApplicationRecord
  has_many :student_teachers
  has_many :students, through: :student_teachers

  has_secure_password
end
