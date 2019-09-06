class Material < ApplicationRecord
  has_many :assignments
  has_many :users, through: :assignments
  belongs_to :course
end
