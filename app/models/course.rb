class Course < ApplicationRecord
  has_many :materials
  has_many :users
end
