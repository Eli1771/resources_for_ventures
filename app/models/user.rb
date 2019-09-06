class User < ApplicationRecord
  has_many :assignments
  has_many :materials, through: :assignments
  belongs_to :course

  has_secure_password
end
