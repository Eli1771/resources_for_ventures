class Student < ApplicationRecord
  has_many :student_teachers
  has_many :teachers, through: :student_teachers
  has_many :assignments
  has_many :materials, through: :assignments
end
